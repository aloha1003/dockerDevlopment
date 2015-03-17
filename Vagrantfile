# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
    config.vm.define "main", primary: true do |node|
        node.config.vm.box = "ubuntu/trusty64"
        #Configure work directory
        node.config.vm.synced_folder ".", SYNCED_FOLDER
        #Configure private network
        node.config.vm.network "private_network", ip: "10.0.0.10"
        node.config.vm.provision "hosts" do |hosts|
            hosts.add_host '10.0.0.200', ['registry.com', 'registry']
        end
        for i in FORWARDED_PORT_RANGE
                node.vm.network "forwarded_port", guest: i, host: i
        end
    end
end
