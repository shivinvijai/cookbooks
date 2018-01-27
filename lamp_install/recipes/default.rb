#
# Cookbook Name:: LAMP Installation
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
end

cookbook_file '/usr/share/nginx/html/index.html' do
  source 'index.html'
  action :create
end

# Install the mod_php5 Apache module.
package 'php5' do
  action :install
  #notifies :restart, 'nginx', :immediately
end

# Install php5-mysql.
package 'php5-mysql' do
  action :install
end

cookbook_file '/usr/share/nginx/html/phpinfo.php' do
  source 'phpinfo.php'
  action :create
end

cookbook_file '/etc/nginx/sites-available/default' do
  source 'default'
  action :create
end

service 'nginx' do
	action :restart
end

package 'mysql-server' do
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