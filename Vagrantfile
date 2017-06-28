# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
  {
    :name => "master",
    :box => "centos/6",
    :ip => '10.0.0.11',
    :cpu => "30",
    :ram => "256"
  },
  {
    :name => "server1",
    :box => "centos/6",
    :ip => '10.0.0.12',
    :cpu => "30",
    :ram => "256"
  },
  {
    :name => "server2",
    :box => "centos/6",
    :ip => '10.0.0.13',
    :cpu => "30",
    :ram => "256"
  },
]

Vagrant.configure("2") do |config|
  boxes.each do |box|
    config.vm.define box[:name] do |vms|
      vms.vm.box = box[:box]
      vms.vm.hostname = "puppet-#{box[:name]}"

      vms.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--cpuexecutioncap", box[:cpu]]
        v.customize ["modifyvm", :id, "--memory", box[:ram]]
      end
      vms.vm.network :private_network, ip: box[:ip]
      vms.vm.provision :shell, path: "bootstrap.sh"
    end
  end
  # config.vm.network "forwarded_port", guest: 80, host: 8080
end
