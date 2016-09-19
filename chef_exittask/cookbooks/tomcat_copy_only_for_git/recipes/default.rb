#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#package "java-1.7.0-openjdk-devel" do
#  action :install
#end
# Installation tomcat (from epel repository)
package "tomcat" do
  action :install
end
# installation of default web-apps for tomcat
package "tomcat-webapps" do
  action :install
end

# Put in the tomcat server config
template '/usr/share/tomcat/conf/server.xml' do
  source 'server.erb'
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
end

# Activation and starting tomcat as service
service 'tomcat' do
  init_command "/etc/init.d/tomcat"
  supports :restart => true, :status => true, :stop => true
  action [ :enable, :start ]
end
