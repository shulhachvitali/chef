# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "chef" do |chef|
    chef.vm.box = "centos/6"
    chef.vm.hostname = "chef"
    chef.vm.network "private_network", ip: "192.168.33.200"
    chef.vm.provider "virtualbox" do |cfg|
      cfg.name = "chef-cfg"
      cfg.cpus = 1
      cfg.memory = 2048
   end
    chef.vm.provision "shell", path: "chef.script.sh" 
  end
end

