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


rabbitmq_user "shivin" do
  password "sekretpass"
  action :add
end

rabbitmq_vhost "/shivin" do
  action :add
end

rabbitmq_user "shivin" do
  vhost "/shivin"
  permissions ".* .* .*"
  action :set_permissions
end
