Vagrant.configure(2) do |config|
  config.vm.box = "alvaro/wp-ready"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provision "shell", path: "scripts/provision.sh"
  config.vm.provision "shell", path: "scripts/mysql.sh"
end
