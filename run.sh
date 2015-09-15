#!/usr/bin/env bash
set -euo pipefail

echo 'Installing chef...'
ssh opencal.opendisclosure.io 'if [ ! $(which chef-solo) ]; then curl -L https://www.chef.io/chef/install.sh | sudo bash; fi'

echo 'Installing /etc/chef/solo.rb'
ssh opencal.opendisclosure.io /bin/bash -c "
sudo mkdir -p /etc/chef /data/cookbook;
sudo chown backend:opencal /data/cookbook -R;
echo 'cookbook_path \"/data/cookbook\"' | sudo tee /etc/chef/solo.rb
"

echo 'Deploying...'
rsync --rsync-path 'sudo -u backend rsync' \
  --delete --archive . opencal.opendisclosure.io:/data/cookbook/disclosure-cookbook
ssh opencal.opendisclosure.io 'sudo chef-solo -o "recipe[disclosure-cookbook]" '
