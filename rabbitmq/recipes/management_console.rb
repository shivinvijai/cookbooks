include_recipe 'rabbitmq::default'

plugins = %w( rabbitmq_management rabbitmq_management_visualiser )

plugins.each do |plugin|
  rabbitmq_plugin plugin do
    action :enable
    notifies :restart, "service[#{service_name}]", :immediately
  end
end