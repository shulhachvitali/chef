# chef labs
### Lab #6
Description:
Lab 6 is full automated with provision script, starting after machine creating (on base of official redhat centos 6 image).
[Script]( chef.script.sh ) downloads resources we need for chef provisioning, and config everything from beginning to end. 
It really works, as is seen from [log]( console-output.file ) and [chef.json](chef.json).
Iptables has installed, but does not work due to wrong version for centos6, but [nginx]( curl_nginx.log ) works.
