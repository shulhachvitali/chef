#
# Cookbook Name:: web_apache
# Recipe:: default
#
web "install apache" do
  action :install
  provider "web_apache"
end

web "setup default page" do
  action :setup
  provider "web_apache"
end

web "start apach" do
  action :start
  provider "web_apache"
end
