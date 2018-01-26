#
# Cookbook Name:: PHP Instal.
# Recipe:: default
#
# Copyright 2018, Shivin Vijai
#
# All rights reserved.
#

# Install the mod_php5 Apache module.
httpd_module 'php5' do
  instance 'default'
end

# Install php5-mysql.
package 'php5-mysql' do
  action :install
  notifies :restart, 'httpd_service[default]'
end