#
# Cookbook Name:: Docker Compose
# Recipe:: default
#
# Copyright 2018, Shivin Vijai
#
# All rights reserved.
#
package 'Install Docker' do
  case node[:platform]
  when 'redhat', 'centos', 'amazon'
    package_name 'docker'
  when 'ubuntu', 'debian'
    package_name 'docker.io'
  end
end

service 'Docker' do
  service_name 'docker'
  supports restart: true, reload: true
  action %w(enable start)
end

package 'python-pip'

python_pip 'docker-compose'