elasticsearch_user 'elasticsearch'
elasticsearch_install 'elasticsearch'
elasticsearch_configure 'elasticsearch'
elasticsearch_service 'elasticsearch'

elasticsearch_plugin 'head' do
  url 'mobz/elasticsearch-head'
end
