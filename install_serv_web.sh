#!/bin/bash
##########
### Created by Jesus Maria aka SchumaVE <jesuslobaton@gmail.com>
##########

#Configuracion Generales
DBPASSWD=1234

# Update server
###apt-get update -y
#apt-get upgrade -y 

# Install Apache
apt-get install apache2 -y
#Install PHP
sudo apt-get -y install php5 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-mysql php-apc php5-xsl -y
# Install MySQL
echo "mysql-server mysql-server/root_password password $DBPASSWD" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | sudo debconf-set-selections
apt-get install mysql-client mysql-server -y
# Install PhpMyAdmin
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password $DBPASSWD' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password $DBPASSWD' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password $DBPASSWD' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
sudo apt-get install phpmyadmin -y
sudo apt-get install curl git -y

#configuracion del apache
#sudo cat vhost_symfony.conf > /etc/apache2/sites-available/vhost_symfony.conf
#sudo wget -c https://github.com/jlobaton/symfony14/blob/master/vhost_symfony.conf -O /etc/apache2/sites-available/vhost_symfony.conf
#echo "ServerName localhost" | sudo tee /etc/apache2/sites-available/symfony.conf
#sudo ln -s /etc/apache2/sites-available/vhost_symfony.conf /etc/apache2/sites-enabled/vhost_symfony.conf

#configuracion del MySql
sed -e '/bind-address/ s/^#*/# /' -i /etc/mysql/my.cnf

# Restart Apache service
service apache2 restart

# Restart Mysql service
service mysql restart

