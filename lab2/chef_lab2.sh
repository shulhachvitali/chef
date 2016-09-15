#!/bin/bash
mkdir /root/.chef 
mkdir -p /root/chef_cookbooks/jboss 
mkdir -p /root/chef_cookbooks/java
mkdir /root/chef_resources
touch /root/.chef/runlist.json
cd /root/chef_resources/
cp /vagrant/lectures/resources/chef* /root/chef_resources/
cp /vagrant/lectures/resources/jboss-eap-5.1.2.zip /root/chef_resources/
cp /vagrant/lectures/resources/jboss.tar.gz /root/chef_resources/
#wget https://packages.chef.io/stable/el/6/chef-12.13.37-1.el6.x86_64.rpm >/dev/null
#wget https://packages.chef.io/stable/el/6/chefdk-0.17.17-1.el6.x86_64.rpm > /dev/null
rpm -i chef-12.13.37-1.el6.x86_64.rpm
rpm -i chefdk-0.17.17-1.el6.x86_64.rpm
echo `chef -v`
cat > /root/.chef/runlist.json <<EOF
{
"run_list": ["recipe[java::default]","recipe[jboss::default]"]
}
EOF
cat > /root/.chef/solo.rb <<EOF
log_level :debug
file_cache_path "/root/.chef"
cookbook_path "/root/chef_cookbooks/java/cookbooks", "/root/chef_cookbooks/jboss/cookbooks"
json_attribs "/root/.chef/runlist.json"
EOF
yum install git -y
cd /root/chef_resources/
wget https://github.com/agileorbit-cookbooks/java/archive/1.6.4.zip
unzip 1.6.4.zip
cd /root/chef_resources/java-1.6.4/
berks install
berks package
tar -xvzf /root/chef_resources/java-1.6.4/cookbooks-*.tar.gz -C /root/chef_cookbooks/java/

#http://download.jboss.org/jbossas/6.1/jboss-as-distribution-6.1.0.Final.zip
#/opt/jboss-6.1.0.Final/server/default/deploy
#chef-solo -c /root/.chef/solo.rb > /root/chef.console.output.lab2

