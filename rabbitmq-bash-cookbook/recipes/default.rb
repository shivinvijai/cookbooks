#
# Cookbook Name:: RabbitMQ installation using bash chef resources.
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'install_rabbitmq_key' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  wget --quiet -O - https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
  echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
  wget --quiet -O - https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
  sudo apt-get update -y
  EOH
end

package 'rabbitmq-server-install' do
  package_name 'rabbitmq-server'
  package_name 'erlang'
  package_name 'erlang-nox'
end

bash 'create_users' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  sudo update-rc.d rabbitmq-server defaults
  sudo rabbitmqctl add_user admin password
  sudo rabbitmqctl set_user_tags admin administrator
  sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
  sudo rabbitmq-plugins enable rabbitmq_management
  EOH
end

