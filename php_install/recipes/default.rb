#
# Cookbook Name:: PHP Instal.
# Recipe:: default
#
# Copyright 2018, Shivin Vijai
#
# All rights reserved.
#

# Install the mod_php5 Apache module.
package 'php5' do
  action :install
end

# Install php5-mysql.
package 'php5-mysql' do
  action :install
end