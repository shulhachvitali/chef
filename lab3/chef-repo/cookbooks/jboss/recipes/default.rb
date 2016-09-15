#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
node.override['java']['install_flavor'] = "oracle"
node.override['java']['jdk_version'] = "6"
node.override['java']['oracle']['accept_oracle_download_terms'] = true

include_recipe 'java'

package "unzip" do
  action :install
end

user node['jboss']['jboss_user'] do
  comment 'jboss user'
  home node['jboss']['jboss_home']
  system true
  shell '/bin/bash'
  password 'jboss'
end

group node['jboss']['jboss_group'] do
  action :create
end
 
remote_file "#{ node['jboss']['tmp_dir'] }/jboss-as-distribution-6.1.0.Final.zip" do
  source node['jboss']['url']
  owner node['jboss']['jboss_user']
  group node['jboss']['jboss_group']
  mode '0755'
  action :create
  not_if { ::File.exists?("#{ node['jboss']['tmp_dir'] }/jboss-as-distribution-6.1.0.Final.zip")}
end

execute 'unzip_jboss' do
  command "unzip jboss-as-distribution-6.1.0.Final.zip -d #{ node['jboss']['install_path'] }"
  cwd node['jboss']['tmp_dir']
  not_if { File.directory?("#{ node['jboss']['jboss_home'] }") }
end

 remote_file "#{ node['jboss']['tmp_dir'] }/hudson.zip" do
  source node['jboss']['app_url']
  owner node['jboss']['jboss_user']
  group node['jboss']['jboss_group']
  mode '0755'
  action :create
  not_if { ::File.exists?("#{ node['jboss']['tmp_dir'] }/hudson.zip")}
end

execute 'unzip_app' do
  command "unzip hudson.zip -d #{ node['jboss']['deploy_path'] }"
  cwd node['jboss']['tmp_dir']
  not_if { File.directory?( "#{ node['jboss']['deploy_path']}/hudson" ) }
end

template "#{node['jboss']['deploy_path']}/hudson/hudson.xml" do
  source "hudson.erb"
  owner node['jboss']['jboss_user']
  group node['jboss']['jboss_group']
  mode '0755'
end


template "#{ node['jboss']['jboss_home'] }/bin/run.sh" do
  source "run_sh.erb"
  owner node['jboss']['jboss_user']
  group node['jboss']['jboss_group']
  mode '0755'
end

template "/etc/init.d/jboss" do
  source "jboss_init.erb"
  owner 'root'
  group 'root'
  mode '0755'
  variables ({
     :jboss_user => node['jboss']['jboss_user'],
     :jboss_home => node['jboss']['jboss_home'],
     :jboss_ip => node['jboss']['jboss_ip']
  })
  not_if { File.exist?('/etc/init.d/jboss' )}
end

directory node['jboss']['jboss_log'] do
  owner 'jboss'
  group 'jboss'
  mode '0755'
  action :create
  not_if { File.directory?( "#{ node['jboss']['jboss_log'] }" ) }
end

execute 'jboss_home_access' do
  command "chown -R #{ node['jboss']['jboss_user'] }:#{ node['jboss']['jboss_group'] } #{ node['jboss']['jboss_home'] }"
end


service 'jboss' do
  init_command "/etc/init.d/jboss"
  supports :restart => true, :status => true, :stop => true
  action [ :enable, :start ]
end


