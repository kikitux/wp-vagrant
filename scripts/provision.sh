#!/bin/bash

# Update apt and get dependencies
which nginx mysql php5-fpm &>/dev/null || {
  export DEBIAN_FRONTEND=noninteractive
  sudo -E apt-get update
  sudo -E apt-get install -y nginx mysql-server-5.5 php5-fpm php5-mysql php5-curl php5-mcrypt php5-gd
  mkdir -p /usr/share/nginx/wordpress
  [ -h /etc/nginx/sites-enabled/default ] &&  unlink /etc/nginx/sites-enabled/default
  
}

#create wp-ms file
cat > /etc/nginx/sites-available/wp-ms <<EOF
server {
    listen [::]:80 ipv6only=off;
    server_name localhost;

    root /usr/share/nginx/wordpress;
    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ /index.php?$args ;
    }

    location ~ /favicon.ico {
        access_log off;
        log_not_found off;
    }

    location ~ \.php$ {
        try_files \$uri /index.php;
        include fastcgi_params;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
    }

    access_log  /var/log/nginx/$host-access.log;
    error_log   /var/log/nginx/wpms-error.log;
}
EOF

[ -h /etc/nginx/sites-enabled/wp-ms ] || ln -s /etc/nginx/sites-available/wp-ms /etc/nginx/sites-enabled/wp-ms

service nginx configtest
service nginx restart
  
[ -f /usr/local/mysql.done ] || {
mysql -u root << EOF
CREATE DATABASE wordpress;
CREATE USER 'wordpress_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_user'@'localhost';
FLUSH PRIVILEGES;
exit
EOF
touch /usr/local/mysql.done 
}


[ -f /usr/local/wp.done ] || {
mkdir -p /usr/share/nginx/wordpress
mkdir -p /usr/local/wp
pushd /usr/local/wp
wget -N http://wordpress.org/latest.tar.gz
pushd /usr/share/nginx
tar -xf /usr/local/wp/latest.tar.gz
chown -R www-data:www-data /usr/share/nginx/wordpress
touch /usr/local/wp.done 
}
