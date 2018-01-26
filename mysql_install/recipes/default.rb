#
# Cookbook Name:: Mysql Instal.
# Recipe:: default
#
# Copyright 2018, Shivin Vijai
#
# All rights reserved.
#
package 'mysql-server' do
  action :install
end

package 'mysql-devel' do
  action :install
end

package 'mysql' do
  action :install
end

template "/etc/my.cnf" do
  owner 'root'
  group 'root'
  mode 0644
  source "my.conf.erb"
end

service "mysql" do
  supports :status => true, :restart => true, :reload => true
  action :enable
end
