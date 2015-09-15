user 'backend' do
  home '/data/backend'
end

directory '/data/backend' do
  recursive true
  owner 'backend'
  group 'backend'
end

cookbook_file '/usr/local/bin/deploy-backend' do
  mode 0775
  group 'opencal'
end

cookbook_file '/etc/init/disclosure-backend.conf' do
  source 'upstart.conf'
end

service 'disclosure-backend' do
  action [:enable, :start]
end

file '/etc/sudoers.d/backend' do
  mode 0440
  content "backend ALL=(ALL:ALL) /sbin/initctl restart disclosure-backend\n"
  verify '/usr/sbin/visudo -c -f %{file}'
end
