package 'python-virtualenv'
package 'libmysqlclient-dev'
package 'libpq-dev'
package 'libjpeg-dev'
package 'python-dev'

group 'opencal'

include_recipe 'java'
include_recipe 'disclosure-cookbook::_nginx'
include_recipe 'disclosure-cookbook::_cronjobs'
include_recipe 'disclosure-cookbook::_backend_deploy'
include_recipe 'disclosure-cookbook::_elasticsearch'
