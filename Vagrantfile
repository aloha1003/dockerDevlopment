# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
SYNCED_FOLDER = "/home/vagrant/docker-dev"
FORWARDED_PORT_RANGE = 10080..10100

Vagrant.configure(2) do |config|
    config.vm.define "main", primary: true do |node|
        node.vm.provider "virtualbox" do |v|
          #v.gui = true
          v.name = "main"
        end
        node.vm.box = "williamyeh/ubuntu-trusty64-docker"
        #Configure work directory
        node.vm.synced_folder ".", SYNCED_FOLDER
        #Configure private network
        node.vm.network "private_network", ip: "10.0.0.10"
        node.vm.provision "hosts" do |hosts|
            hosts.add_host '10.0.0.200', ['registry.com', 'registry']
        end
        for i in FORWARDED_PORT_RANGE
                node.vm.network "forwarded_port", guest: i, host: i
        end
        node.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024"]
            #vb.customize ["modifyvm", :id, "--memory", "2048"]
        end
    end
end
