# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
    
    # VM1
    config.vm.define :svr do |svr_puppet|
      svr_puppet.vm.host_name = "puppet-server.epbyminw2473.minsk.epam.com"
      svr_puppet.vm.network "private_network", ip:"192.168.10.101"
      svr_puppet.vm.provider :virtualbox do |vbox|
         vbox.customize ["modifyvm", :id, "--memory", "3096"]
      end
      svr_puppet.vm.provision "shell", path: "srv_provision.sh"
    end

    # VM2
    config.vm.define :node1 do |node_puppet|
      node_puppet.vm.host_name = "puppet-node1.epbyminw2473.minsk.epam.com"
      node_puppet.vm.network "private_network", ip:"192.168.10.102"
      node_puppet.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "1536"]
      end  
      node_puppet.vm.provision "shell", path: "node_provision.sh"
    end
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

end
