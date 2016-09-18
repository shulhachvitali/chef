#
# Cookbook Name:: web_nginx
# Recipe:: default
#
# web "install nginx repo" do
#  action :preinstall
#  provider "web_nginx"
# end

web "install nginx" do
  action :install
  provider "web_nginx"
end

web "setup the default page" do
  action :setup
  provider "web_nginx"
end

web "starting nginx" do
  action :start
  provider "web_nginx"
end
