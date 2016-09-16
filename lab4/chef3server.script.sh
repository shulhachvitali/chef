#!/bin/bash
mkdir /root/.chef 
mkdir -p /root/chef_cookbooks
mkdir /root/chef_resources
apt-get install git -y
cd /root/chef_resources/
#wget https://packages.chef.io/stable/ubuntu/14.04/chef-server-core_12.8.0-1_amd64.deb
cp /vagrant/sources/chef-server-core_12.8.0-1_amd64.deb /root/chef_resources/
dpkg -i chef-server-core_12.8.0-1_amd64.deb

####ON SERVER:
#https://learn.chef.io/install-and-manage-your-own-chef-server/linux/install-chef-server/install-chef-server-using-your-hardware/#step4
#cat > /etc/opscode/chef-server.rb <<EOF
#server_name = "#########" <- chef3server 
#api_fqdn server_name
#bookshelf['vip'] = server_name
#nginx['url'] = "https://#{server_name}"
#nginx['server_name'] = server_name
#nginx['ssl_certificate'] = "/var/opt/opscode/nginx/ca/#{server_name}.crt"
#nginx['ssl_certificate_key'] = "/var/opt/opscode/nginx/ca/#{server_name}.key"
#EOF
#sudo chef-server-ctl reconfigure
#sudo chef-server-ctl install chef-manage
#sudo chef-server-ctl reconfigure
#sudo chef-manage-ctl reconfigure
#sudo chef-server-ctl user-create vitali vitali shulhach vitali_shulhach@epam.com vitali --filename vitali.pem
#sudo chef-server-ctl user-create user user users user@some.mail userpass --filename user.pem
#sudo chef-server-ctl org-create lab8 "lab_8" --association_user user
############ON CLIENT:
# Download Starter Kit
#knife ssl fetch from /chef-repo
#knife ssl check
#knife client list
######AGAIN ON CLIENT:
#[root@chefcl1 chef-repo]# knife environment create Chef-dev -e vim
#{
#  "name": "Chef-dev",
#  "description": "new environment",
#  "cookbook_versions": {
#  },
#  "json_class": "Chef::Environment",
#  "chef_type": "environment",
#  "default_attributes": {
#
#  },
#  "override_attributes": {
#"app_url": "http://www.cumulogic.com/download/Apps/hudson.zip"
#  }
#}
#knife role create JBOSS
#{
#  "name": "JBOSS",
#  "description": "test role",
#  "json_class": "Chef::Role",
#  "default_attributes": {
#
#  },
#  "override_attributes": {
#
#  },
#  "chef_type": "role",
#  "run_list": [
#    "recipe[jboss]"
#  ],
#  "env_run_lists": {
#
#  }
#}
#[root@chefcl1 chef-repo]# knife bootstrap 192.168.33.135 --ssh-user root --ssh-password vagrant --node-name JBOSSNODE -r 'role[JBOSS]'
#[root@chefcl1 chef-repo]# knife bootstrap 192.168.33.135 --ssh-user root --ssh-password vagrant --node-name JBOSSNODE -r 'role[web_apache]'
#[root@chefcl1 chef-repo]# knife bootstrap 192.168.33.135 --ssh-user root --ssh-password vagrant --node-name JBOSSNODE -r 'web_nginx'
#knife bootstrap 192.168.33.135 --ssh-user root --ssh-password vagrant --node-name JBOSSNODE --run-list "role[web_server_nginx]"
#APACHE
#{
#  "name": "web_server_apache",
#  "description": "web server apache role",
#  "json_class": "Chef::Role",
#  "default_attributes": {
#
#  },
#  "override_attributes": {
#
#  },
#  "chef_type": "role",
#  "run_list": [
#    "recipe[web]"
#  ],
#  "env_run_lists": {
#
#  }
#}
#NGINX
#{
#  "name": "web_server_nginx",
#  "description": "web server nginx",
#  "json_class": "Chef::Role",
#  "default_attributes": {
#
#  },
#  "override_attributes": {
#
#  },
#  "chef_type": "role",
#  "run_list": [
#    "recipe[web]"
#  ],
#  "env_run_lists": {
#
#  }
#}
NGINX
{
  "name": "web_nginx",
  "description": "environment_nginx",
  "cookbook_versions": {

  },
  "json_class": "Chef::Environment",
  "chef_type": "environment",
  "default_attributes": {

  },
  "override_attributes": {
  "web_server_type": "web_server_nginx"
  }
}

~   

~                                                                                                                                
~              





