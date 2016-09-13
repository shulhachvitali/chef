#!/bin/bash
mkdir /root/.chef 
mkdir -p chef_cookbooks/iptables 
mkdir -p chef_cookbooks/nginx
mkdir /root/chef_resources
touch /root/.chef/runlist.json
cd /root/chef_resources/
wget https://packages.chef.io/stable/el/6/chef-12.13.37-1.el6.x86_64.rpm >/dev/null
wget https://packages.chef.io/stable/el/6/chefdk-0.17.17-1.el6.x86_64.rpm > /dev/null
rpm -i chef-12.13.37-1.el6.x86_64.rpm
rpm -i chefdk-0.17.17-1.el6.x86_64.rpm
echo `chef -v`
cat > /root/.chef/solo.rb << EOF
log_level :debug
file_cache_path "/root/.chef"
cookbook_path "/root/chef_cookbooks/nginx/cookbooks", "/root/chef_cookbooks/iptables/cookbooks"
json_attribs "/root/.chef/runlist.json"
EOF
#yum install git -y
#knife cookbook site download iptables
#tar -xvf /root/chef_resources/iptables-*.tar.gz -C /root/chef_cookbooks/
#git clone https://github.com/miketheman/nginx
wget https://github.com/chef-cookbooks/iptables/archive/v2.0.2.zip
unzip v2.0.2.zip
cd /root/chef_resources/iptables-2.0.2
berks install
berks package
tar -xvf /root/chef_resources/iptables-2.0.2/cookbooks-*.tar.gz -C /root/chef_cookbooks/iptables
cd /root/chef_resources/
wget https://github.com/miketheman/nginx/archive/2.7.x.zip
unzip 2.7.x.zip
cd /root/chef_resources/nginx-2.7.x/
berks install
berks package
tar -xvf /root/chef_resources/nginx-2.7.x/cookbooks-*.tar.gz -C /root/chef_cookbooks/nginx
#cd /root/cookbooks
#cp -R ./ /root/chef_cookbooks/
cat > /root/.chef/runlist.json <<EOF
{
"run_list": ["recipe[nginx::default]", "recipe[iptables::default]"],
  "nginx": {"default_root":"/usr/share/nginx/html"}
}
EOF
chef-solo -c /root/.chef/solo.rb > /root/chef.console.output

