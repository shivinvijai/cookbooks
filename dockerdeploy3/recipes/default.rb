#
# Cookbook Name:: Docker Installation
# Recipe:: default
#
# Copyright 2018, Shivin Vijai
#
# All rights reserved.
#
bash 'deploy' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  docker pull wordpress
  docker pull mysql
  docker run --name mysqlDb -e MYSQL_ROOT_PASSWORD=Welcome1 -d mysql
  docker run --name wordpress01 --link mysqlDb -p 80:80 -e WORDPRESS_DB_HOST=mysqlDb:3306 -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=Welcome1 -e WORDPRESS_DB_NAME=wordpress -e WORDPRESS_TABLE_PREFIX=wp_ -d wordpress
  EOH
end