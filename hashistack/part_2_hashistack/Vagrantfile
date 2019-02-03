# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    (1..2).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = "ubuntu/trusty64"
            node.vm.hostname = "node-#{i}"
            # Bridged network
            node.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)", ip:"192.168.0.11#{i}"
            # Provider-specific configuration
            node.vm.provider "virtualbox" do |vb|
                # Customize the amount of memory on the VM
                vb.memory = "2048"
                # Specify machine name
                vb.name = "hashistack_node-#{i}"
            end
        end
    end
end
  