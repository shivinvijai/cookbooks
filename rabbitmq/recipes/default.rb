#
# Cookbook Name:: rabbitmq
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Installing Rabbitmq package

package 'rabbitmq-server' do
  action :install
end

# Starting Rabbitmq service

service 'rabbitmq-server' do
  action :start
end

# Creating a rabbitmq user. Defined 'rabbitmq_user' in resources folder

rabbitmq_user "shivin" do
  password "sekretpass"
  action :add
end

# Creating a rabbitmq virtual host. Defined 'rabbitmq_vhost' in resources folder

rabbitmq_vhost "/shivin" do
  action :add
end

# Granding permissions for the user to vhost

rabbitmq_user "shivin" do
  vhost "/shivin"
  permissions ".* .* .*"
  action :set_permissions
end

# Installing web console management UI.

package 'rabbitmq-server-plugins' do
    action :install
end
