The chef-repo
===============
chef-repo

Knife Configuration
-------------------
knife command to run:
knife bootstrap 192.168.33.135 --ssh-user root --ssh-password vagrant --node-name JBOSSNODE --run-list "role[EXIT_TASK]"

Cookbooks
---------
'web_nginx'
'tomcat'
'jenkins_task'

Roles
-----
{
  "name": "EXIT_TASK",
  "description": "exit_task role",
  "json_class": "Chef::Role",
  "default_attributes": {

  },
  "override_attributes": {
    "web_nginx": {
      "nginx_default_port": "8080",
      "jenkins_port": "8090",
      "tomcat_port": "9090"
    }
  },
  "chef_type": "role",
  "run_list": [
    "recipe[jenkins_task]",
    "recipe[tomcat]",
    "recipe[web_nginx]"
  ],
  "env_run_lists": {

  }

Results:
------
see EXIT_TASK.log
------

Kitchen-test:

Was ok on student machine.
Original Environment was built on vagrant virtual machines

Yard-chef:
It has generated documentation, but it is very poor (in cookbooks/doc)


https://github.com/MNTLab/cm-ansible-2/tree/vitali_shulhach/vagrant/ansible - ansible original task

------
##Brief summary:
------
1. I have used the same vagrant virtual machine as in previous task.
2. Provision was started as a EXIT_TASK role, witch included 3 cook books: 
'web_nginx'
'tomcat'
'jenkins_task'
3. Jenkins cookbook installed first, tomcat - second, and nginx was the last one to exclude errors of missing listeners on the binded ports for first two instances.
4. Modules and job into jenkins was imported as a collection of the files and folders. Pipeline started and built successfully.
The result is on the [screenshot]( application_success.png )
5. Kitchen test ended successfully[log]( /.kitchen/logs/default-centos-6.log )
6. Chef yard generated the [documentation](/doc),but it is very little. 
