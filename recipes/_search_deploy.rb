user 'search' do
  home '/data/search'
end

directory '/data/search' do
  recursive true
  owner 'search'
  group 'search'
end

cookbook_file '/usr/local/bin/deploy-search' do
  mode 0755
  group 'opencal'
end
