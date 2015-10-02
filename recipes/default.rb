package 'python-virtualenv'
package 'libmysqlclient-dev'
package 'libpq-dev'
package 'python-dev'

group 'opencal'

include_recipe 'nvm'
nvm_install 'v0.10.39'  do
    user 'backend'
    group 'opencal'
    user_install true
    user_home '/data/backend'
    from_source false
    alias_as_default true
    action :create
end

include_recipe 'disclosure-cookbook::_nginx'
include_recipe 'disclosure-cookbook::_cronjobs'
include_recipe 'disclosure-cookbook::_backend_deploy'
