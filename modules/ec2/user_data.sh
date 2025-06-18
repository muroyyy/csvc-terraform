#!/bin/bash
apt update -y
apt install -y apache2 php libapache2-mod-php git unzip
systemctl start apache2
systemctl enable apache2

cd /var/www/html
rm -f index.html
git clone "${github_repo_url}" temprepo
cp -r temprepo/* .
rm -rf temprepo
