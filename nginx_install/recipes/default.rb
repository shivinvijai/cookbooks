#
# Cookbook Name:: Using Nginx, port forwarding one port from a private subnet to access from public.
# Recipe:: default
#
# Copyright 2018, Shivin Vijai
#
# All rights reserved.
#
package 'nginx' do
  action :install
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action [ :enable, :start ]
  #subscribes :reload, 'file[/etc/nginx/sites-available/port_forward.conf]', :immediately
end

cookbook_file '/usr/share/nginx/html/shivin.html' do
  source 'index.html'
  action :create
end
