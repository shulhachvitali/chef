#
# Cookbook Name:: jenkins_task
# Recipe:: default
# Install java via yum. Only with epel-repo. Without it java cookbook would be used
package "java-1.7.0-openjdk-devel" do
  action :install
end

# Activation jenkins repository with the rpm key 
yum_repository 'jenkins.repo' do
  baseurl "http://pkg.jenkins-ci.org/redhat"
  gpgkey "https://jenkins-ci.org/redhat/jenkins-ci.org.key"
  action :create
end


#  description "jenkins repo", alternative option
#  baseurl "http://pkg.jenkins.io/redhat-stable/jenkins.repo"
#  gpgkey 'http://pkg.jenkins.io/redhat-stable/jenkins.io.key'
#  action :create
# end

# next steps install jenkins and git via yum
package "jenkins" do
  action :install
end
package "git" do
  action :install
end

# Copying files (jobs, plugins, config) to jenkins home dir 
remote_directory "/var/lib/jenkins" do
  files_mode '0755'
  files_owner 'jenkins'
  mode '0755'
  owner 'jenkins'
  source "jenkins_conf"
end

# Main jenkins config
template '/etc/sysconfig/jenkins' do
  source 'jenkins.erb'
  owner 'jenkins'
  group 'jenkins'
  mode '0755'
end

# Setting and starting jenkins as a service
service 'jenkins' do
  init_command "/etc/init.d/jenkins"
  supports :restart => true, :status => true, :stop => true
  action [ :enable, :start ]
end

