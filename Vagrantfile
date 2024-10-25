# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  BOX_IMAGE = "ubuntu/jammy64"
  VMRAM=2048
  VMCPU=2
  BASE_HOST_ONLY_NETWORK ="192.168.56"
  BASE_INT_NETWORK="10.10.20"
  PROXY_URL ="http://proxy.cpt.local:8080"
  PROXY_ENABLE= false
  
  config.vm.define "web" do |subconfig|
	#https://developer.hashicorp.com/vagrant/docs/cli/plugin
	#https://stackoverflow.com/questions/19872591/how-to-use-vagrant-in-a-proxy-environment
	if PROXY_ENABLE
		unless Vagrant.has_plugin?("vagrant-proxyconf")
			raise "Installare il plug  vagrant-proxyconf con il comando: vagrant plugin install vagrant-proxyconf"
		end
		subconfig.proxy.http     = PROXY_URL
		subconfig.proxy.https    = PROXY_URL
		subconfig.proxy.no_proxy = "localhost,127.0.0.1"
	end
    subconfig.vm.box = BOX_IMAGE
	subconfig.vm.hostname="web.m340"
    subconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter" 
	subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: true
	#https://developer.hashicorp.com/vagrant/docs/synced-folders/basic_usage
	subconfig.vm.provision "shell", path: "provision/provision-web.sh"
	subconfig.vm.synced_folder "html", "/var/www/html"
	subconfig.vm.provider "virtualbox" do |vb|
	  vb.name ="web.m340"
	  vb.memory = VMRAM
	  vb.cpus = VMCPU
	end
  end

  config.vm.define "db" do |subconfig|
	#https://developer.hashicorp.com/vagrant/docs/cli/plugin
	#https://stackoverflow.com/questions/19872591/how-to-use-vagrant-in-a-proxy-environment
	if PROXY_ENABLE
		unless Vagrant.has_plugin?("vagrant-proxyconf")
			raise "Installare il plug  vagrant-proxyconf con il comando: vagrant plugin install vagrant-proxyconf"
		end
		subconfig.proxy.http     = PROXY_URL
		subconfig.proxy.https    = PROXY_URL
		subconfig.proxy.no_proxy = "localhost,127.0.0.1"
	end
    subconfig.vm.box = BOX_IMAGE
	subconfig.vm.hostname="db.m340"
	subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: true
	subconfig.vm.provision "shell", path: "provision/provision-db.sh"
	subconfig.vm.provider "virtualbox" do |vb|
	  vb.name ="db.m340"
	  vb.memory = VMRAM
	  vb.cpus = VMCPU
	end
  end

end
