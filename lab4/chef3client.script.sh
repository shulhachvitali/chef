mkdir /root/chef_resources/
cd /root/chef_resources/
#wget https://packages.chef.io/stable/el/6/chef-12.14.60-1.el6.x86_64.rpm
#cp /vagrant/sources/jboss/* /root/chef_resources/
#rpm -i chef-12.14.60-1.el6.x86_64.rpm
#for JBOSSNONE installing of chef-client was commented
cat >> /etc/hosts <<HOSTS
192.168.33.130 chef3server
#192.168.33.135 JBOSSNODE
HOSTS
cp -f /vagrant/sshd_config /etc/ssh/sshd_config
yum install git -y
service sshd restart

