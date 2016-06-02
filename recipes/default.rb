package 'python-virtualenv'
package 'libmysqlclient-dev'
package 'libpq-dev'
package 'libjpeg-dev'
package 'python-dev'
package 'ruby' # for now 1.9.1 will get the job done

group 'opencal'

include_recipe 'java'
include_recipe 'nodejs::nodejs_from_binary'
include_recipe 'disclosure-cookbook::_nginx'
include_recipe 'disclosure-cookbook::_cronjobs'
include_recipe 'disclosure-cookbook::_backend_deploy'
include_recipe 'disclosure-cookbook::_search_deploy'
include_recipe 'disclosure-cookbook::_elasticsearch'
