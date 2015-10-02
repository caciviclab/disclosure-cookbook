#!/usr/bin/env bash
set -euo pipefail

echo 'Installing chef...'
ssh disclosure.caciviclab.org 'if [ ! $(which chef-solo) ]; then curl -L https://www.chef.io/chef/install.sh | sudo bash; fi'

echo 'Installing /etc/chef/solo.rb'
ssh disclosure.caciviclab.org /bin/bash -c "
sudo mkdir -p /etc/chef /data/cookbook;
sudo chown backend:opencal /data/cookbook -R;
echo 'cookbook_path \"/data/cookbook\"' | sudo tee /etc/chef/solo.rb
"

echo 'Deploying...'
rsync --rsync-path 'sudo -u backend rsync' \
  --delete --archive . disclosure.caciviclab.org:/data/cookbook/disclosure-cookbook
ssh disclosure.caciviclab.org 'sudo chef-solo -o "recipe[disclosure-cookbook]" '
