#
# Cookbook Name:: cdocker
# Recipe:: default
#
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

include_recipe 'cyclecloud'

# Docker uses a ton of disk space for the local repository
# Put it on ephemeral

directory '/var/lib/' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

directory '/mnt/docker' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

link '/var/lib/docker' do
  to '/mnt/docker'
end

node.set['docker']['docker_daemon_timeout'] = 60
node.set['docker']['tls'] = false

docker_service 'default' do
  action [:create, :start]
end


if not node['docker']['registry']['url'].nil?
#  docker_registry "https://#{node['docker']['registry']['url']}/v1/" do
  docker_registry node['docker']['registry']['url'] do
    username node['docker']['registry']['username']
    password node['docker']['registry']['password']
    email node['docker']['registry']['email']
  end
end

if node['docker']['images'].nil? || node['docker']['images'].empty?
  return
end

images = node['docker']['images']
if !images.is_a?(Array)
  images = images.split(',')
end


images.each do |image|
  image_parts = image.split(':')
  image_name = image_parts[0]
  if image_parts.length > 1
    image_tag = image_parts[1]
    docker_image image_name do
      repo image_name
      tag image_tag
      action :pull
      retries 5
      retry_delay 10
    end
  else
    docker_image image_name do
      action :pull
      retries 5
      retry_delay 10
    end
  end    
end

[ "root", "cyclecloud", node['cyclecloud']['cluster']['user']['name'] ].each do |username|
  group "docker" do
    action :modify
    members username
    append true
  end
end






