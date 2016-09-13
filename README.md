# chef labs
### Lab #6
Description:
Lab 6 is full automated with provision script, starting after the machine creating (on base of the official redhat centos 6 image).
[Script]( chef.script.sh ) downloads resources it needs for the chef provisioning, and configures everything from the beginning to the end. 
It really works, as is seen from [log]( console-output.file ) and [chef.json](chef.json).
Iptables has installed, but does not work due to wrong version (too new for the centos6, as I guess), but [nginx]( curl_nginx.log ) works.
