#!/bin/bash
mkdir /root/.chef 
mkdir -p /root/chef_cookbooks
mkdir /root/chef_resources
apt-get install git -y
cd /root/chef_resources/
#wget https://packages.chef.io/stable/ubuntu/14.04/chef-server-core_12.8.0-1_amd64.deb
cp /vagrant/sources/chef-server-core_12.8.0-1_amd64.deb /root/chef_resources/
dpkg -i chef-server-core_12.8.0-1_amd64.deb





