#
# Cookbook Name:: RabbitMQ installation using bash chef resources.
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'install_rabbitmq' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  wget --quiet -O - https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
  sudo dpkg -i erlang-solutions_1.0_all.deb
  sudo apt-get update -y
  sudo apt-get install erlang erlang-nox -y
  echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
  wget --quiet -O - https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
  sudo apt-get update -y
  sudo apt-get install rabbitmq-server -y
  sudo update-rc.d rabbitmq-server defaults
  sudo service rabbitmq-server start
  sudo rabbitmqctl add_user admin password
  sudo rabbitmqctl set_user_tags admin administrator
  sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
  sudo rabbitmq-plugins enable rabbitmq_management
  EOH
end

