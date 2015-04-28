Vagrant.require_version ">= 1.7.2"
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
SYNCED_FOLDER = "/home/vagrant/docker-dev"
# SYNCED_MONGODB_DB_FOLDER = "/Volumes/MACOS/mongodb/var/mongodb"
# SYNCED_MONGODB_LOG_FOLDER = "/Volumes/MACOS/log/mongodb"
#FORWARDED_PORT_RANGE = 10080..10100
FORWARDED_PORT_RANGE_CUSTOM = [28017,27017,8080,6379,3306]



PROVISION_SCRIPTS = ["provision/setup-env.sh" ]

Vagrant.configure(2) do |config|
    config.vm.define "main", primary: true do |node|
        node.vm.provider "virtualbox" do |v|
          #v.gui = true
          v.name = "main"
        end
        node.vm.box = "williamyeh/ubuntu-trusty64-docker"
        node.vm.box_version = ">= 1.5.0"
        #Configure work directory
        node.vm.synced_folder ".", SYNCED_FOLDER
        #Configure private network
        node.vm.network "private_network", ip: "10.0.0.10"
        node.vm.provision "hosts" do |hosts|
            hosts.add_host '10.0.0.200', ['registry.com', 'registry']
        end

        if Vagrant.has_plugin?('vagrant-hostmanager')
            hosts = Array.new()

            hosts.push("phalcon-module.local");
            hosts.push("angular-skeleton.local");
            hosts.push("phalcon-rest.local");
            hosts.push("phalcon-lynx-rest.local");

            config.hostmanager.enabled           = true
            config.hostmanager.manage_host       = true
            config.hostmanager.ignore_private_ip = false
            config.hostmanager.include_offline   = false
            config.hostmanager.aliases           = hosts
        end

        # for i in FORWARDED_PORT_RANGE
        #         node.vm.network "forwarded_port", guest: i, host: i
        # end
        for i in FORWARDED_PORT_RANGE_CUSTOM
                node.vm.network "forwarded_port", guest: i, host: i
        end
        for f in PROVISION_SCRIPTS
            node.vm.provision "shell", path: f
        end
        node.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024"]
            #vb.customize ["modifyvm", :id, "--memory", "2048"]
        end
    end
end
