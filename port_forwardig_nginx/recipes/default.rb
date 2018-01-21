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
  #subscribes :reload, 'file[/etc/nginx/sites-available/port_forward.conf]', :immediately
end

cookbook_file '/usr/share/nginx/html/shivin.html' do
  source 'shivin.html'
  action :create
end

cookbook_file '/etc/nginx/sites-available/default' do
  source 'port_forward.conf'
  action :create
end

