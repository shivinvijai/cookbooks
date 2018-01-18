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
end


