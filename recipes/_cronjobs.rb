# Remove this file, since these cron entries should really be expressed as Chef,
# and I think the backend user's crontab is a good place to put them.
file '/etc/cron.d/backend' do
  action :delete
end

cron 'run-calaccess-raw-import' do
  user 'backend'
  minute '08'
  hour '0'
  path '/data/backend/env/bin:$PATH'

  command %w{
    /data/backend/current/cron/cronrunner.py
      -l /data/etl-reports
      -o /data/etl-reports/archive
      -n calaccess
        python /data/backend/current/disclosure-backend/manage.py downloadcalaccessrawdata --no-color
        --noinput --verbosity=3
  }.join(' ')
end

cron 'run-netfile-import' do
  user 'backend'
  minute '08'
  hour '1'
  path '/data/backend/env/bin:$PATH'

  command %w{
    /data/backend/current/cron/cronrunner.py
      -l /data/etl-reports
      -o /data/etl-reports/archive
      -n netfile
        python /data/backend/current/disclosure-backend/manage.py downloadnetfilerawdata --no-color
        --noinput --verbosity=3
  }.join(' ')
end