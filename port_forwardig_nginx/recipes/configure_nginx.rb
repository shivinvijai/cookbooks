#
# Cookbook Name:: Default Document Root
# Recipe:: Default Nginx 
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file '/usr/share/nginx/html/shivin.html' do
  source 'shivin.html'
  action :create
end

