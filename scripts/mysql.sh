#!/bin/bash

mysql -u root <<EOF
drop database if exists wordpress;
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO "username"@"localhost" IDENTIFIED BY "password";
FLUSH PRIVILEGES;
EXIT
EOF
