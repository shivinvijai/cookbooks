#
# Cookbook Name:: Using Nginx, port forwarding one port from a private subnet to access from public.
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'nginx' do
  action :install
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action :enable
end

cookbook_file '/usr/share/nginx/html/shivin.html' do
  source 'shivin.html'
  action :create_if_missing
end

