#!/usr/bin/env bash
set -euo pipefail

cookbooks_package="cookbooks-disclosure-backend.tar.gz"
cookbooks_dir="/data/cookbook"

echo 'Installing chef...'
ssh disclosure.caciviclab.org 'if [ ! $(which chef-solo) ]; then curl -L https://www.chef.io/chef/install.sh | sudo bash; fi'

echo 'Installing /etc/chef/solo.rb'
ssh disclosure.caciviclab.org /bin/bash -c "
sudo mkdir -p /etc/chef $cookbooks_dir;
sudo chown backend:opencal $cookbooks_dir -R;
echo 'cookbook_path \"${cookbooks_dir}\"' | sudo tee /etc/chef/solo.rb;
"

echo 'Packaging cookbooks...'
berks package $cookbooks_package

echo 'Uploading cookbooks...'
ssh disclosure.caciviclab.org sudo -u backend rm -rf $cookbooks_dir/*
cat $cookbooks_package | ssh disclosure.caciviclab.org sudo -u backend tar xvz --strip-components=1 -C $cookbooks_dir


echo 'Deploying...'
ssh disclosure.caciviclab.org 'sudo chef-solo -o "recipe[disclosure-cookbook]" '
