#
# Cookbook Name:: dir
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory '/opt/dir1/dir2' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end
