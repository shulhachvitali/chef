#
# Cookbook Name:: web_nginx
# Recipe:: default
#
# web "install nginx repo" do
#  action :preinstall
#  provider "web_nginx"
# end
# Put on the repo-file for nginx
template '/etc/yum.repos.d/nginx.repo' do
  source 'nginx.erb'
end

# Installing nginx from repository
package "nginx" do
  action :install
end

# Set up of the default page
template '/usr/share/nginx/html/index.html' do
  source 'index.erb'
end

# config for virtual host with user's defined port
template '/etc/nginx/conf.d/virtual.conf' do
  source 'virtual.erb'
  owner 'nginx'
  group 'nginx'
  mode '0755'
end

# starting nginx as a service
service 'nginx' do
  init_command "/etc/init.d/nginx"
  supports :restart => true, :status => true, :stop => true
  action [ :enable, :start ]
end
