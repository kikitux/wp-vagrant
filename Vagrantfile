Vagrant.configure(2) do |config|
  #config.vm.box = "ubuntu/trusty64"
  config.vm.box = "alvaro/wp-ready"
  config.vm.provision "shell", path: "scripts/provision.sh"
  config.vm.network "forwarded_port", guest: 80, host: 8080
end
