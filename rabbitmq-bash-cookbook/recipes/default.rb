#
# Cookbook Name:: RabbitMQ installation using bash chef resources.
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
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

bash 'install_rabbitmq' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  sudo update-rc.d rabbitmq-server defaults
  sudo service rabbitmq-server start
  sudo rabbitmqctl add_user admin password
  sudo rabbitmqctl set_user_tags admin administrator
  sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
  sudo rabbitmq-plugins enable rabbitmq_management
  EOH
end
