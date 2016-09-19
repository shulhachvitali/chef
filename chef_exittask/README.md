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
_ _ _ _
see EXIT_TASK.log
------

Kitchen-test:

Was ok on student machine.
Original Environment was built on vagrant virtual machines

Yard-chef:
It has generated documentation, but it is very poor (in cookbooks/doc)


https://github.com/MNTLab/cm-ansible-2/tree/vitali_shulhach/vagrant/ansible - ansible original task



