#
# Cookbook Name:: Docker Installation
# Recipe:: default
#
# Copyright 2018, Shivin Vijai
#
# All rights reserved.
#
case node[:platform]
when "ubuntu","debian"
  package "docker.io" do
    action :install
  end
when 'centos','redhat','fedora','amazon'
  package "docker" do
    action :install
  end
end

service "docker" do
  action :start
end