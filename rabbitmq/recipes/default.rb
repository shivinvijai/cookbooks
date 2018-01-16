
instance_name = node['hostname']

directory "/etc/rabbitmq/" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

template "/etc/rabbitmq/rabbitmq-env.conf" do
  source "rabbitmq-env.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[rabbitmq-server]"
end

case node[:platform]
when "debian", "ubuntu"
  # use the RabbitMQ repository instead of Ubuntu or Debian's
  # because there are very useful features in the newer versions
  apt_repository "rabbitmq" do
    uri "http://www.rabbitmq.com/debian/"
    distribution "testing"
    components ["main"]
    key "http://www.rabbitmq.com/rabbitmq-signing-key-public.asc"
    action :add
  end
  package "rabbitmq-server"
when "redhat", "centos", "scientific"
  remote_file "/tmp/rabbitmq-server-2.6.1-1.noarch.rpm" do
    source "https://www.rabbitmq.com/releases/rabbitmq-server/v2.6.1/rabbitmq-server-2.6.1-1.noarch.rpm"
    action :create_if_missing
  end
  rpm_package "/tmp/rabbitmq-server-2.6.1-1.noarch.rpm" do
    action :install
  end
end

#if node[:demo1][:cluster]
    # If this already exists, don't do anything
    # Changing the cookie will stil have to be a manual process
    template "/var/lib/rabbitmq/.erlang.cookie" do
      source "doterlang.cookie.erb"
      owner "rabbitmq"
      group "rabbitmq"
      mode 0400
      not_if { File.exists? "/var/lib/rabbitmq/.erlang.cookie" }
    end
#end

template "/etc/rabbitmq/rabbitmq.config" do
  source "rabbitmq.config.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[rabbitmq-server]"
end

service "rabbitmq-server" do
  stop_command "/usr/sbin/rabbitmqctl stop"
  supports :status => true, :restart => true
  action [ :enable, :start ]
end
