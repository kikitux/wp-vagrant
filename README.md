# wp-vagrant
Simple Wordpress using Vagrant

1. `git clone https://github.com/kikitux/wp-vagrant`
2. `cd wp-vagrant`
3. `vagrant up`

Then using your local browser go to `http://localhost:8080`

The provision script [`scripts/mysql.sh`](scripts/mysql.sh) will create a `wordpress` db.

The default user will be user: `username` and pass: `password`, so you can just `next` on the WP window.

Please consider updating these to a more secure set if you plan to expose this to the internet.

To connect to the VM use `vagrant ssh`

Alvaro
