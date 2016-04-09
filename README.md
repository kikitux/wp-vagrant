# wp-vagrant
Simple Wordpress using Vagrant

1. `git clone https://github.com/kikitux/wp-vagrant`
2. `cd wp-vagrant`
3. `vagrant up`

Then using your local browser go to `http://localhost:8080`

The provision script `scripts/mysql.sh` will create a `wordpress` db with `username` and `password`.

Please consider updating these to a more secure set if you plan to expose this to the internet.

To connect to the VM use `vagrant ssh`

Alvaro
