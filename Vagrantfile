
Vagrant.configure("2") do |config|
 
  config.vm.network "private_network", ip: "192.168.10.101"
  config.vm.box = "bento/ubuntu-16.04"
   
  config.vm.network "public_network"
   
  config.vm.provision :shell, path: "server.sh"
  config.vm.provision :shell, path: "after.sh", privileged: true

  
end
