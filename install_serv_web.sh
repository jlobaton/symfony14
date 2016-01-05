#!/bin/bash
# Update server
apt-get update -y
#apt-get upgrade -y 
# Install essentials
#apt-get -y install build-essential binutils-doc git -y
# Install Apache
apt-get install apache2 -y
#Install PHP
sudo apt-get -y install php5 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-mysql php-apc php5-xsl -y
# Install MySQL
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
apt-get install mysql-client mysql-server -y
# Install PhpMyAdmin
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
sudo apt-get install phpmyadmin -y
sudo apt-get install curl git -y

#configuracion del apache
#echo "ServerName localhost" | sudo tee /etc/apache2/sites-available/fqdn.conf
#sudo ln -s /etc/apache2/sites-available/fqdn.conf /etc/apache2/sites-enabled/fqdn.conf

# Restart Apache service
service apache2 restart
