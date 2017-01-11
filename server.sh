apt-get update --fix-missing

apt-get install -y git vim php7.0 apache2 composer libapache2-mod-php7.0 php7.0-mbstring php7.0-zip php7.0-xml php7.0-mysql libapache2-mod-fastcgi php7.0-fpm php7.0


#installation of PECL
apt-get install -y php-pear php-dev

#configuring apache
ufw allow in "Apache Full"
a2enmod rewrite
service apache2 restart

#installation of mysql
echo "mysql-server mysql-server/root_password password 123456" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password 123456" | sudo debconf-set-selections
apt-get -y install mysql-server

#creating users and database in mysql
mysql -uroot -p123456 -e "CREATE USER 'homestead'@'localhost' IDENTIFIED BY 'secret';"
mysql -uroot -p123456 -e "GRANT ALL PRIVILEGES ON * . * TO 'homestead'@'localhost';"
mysql -uroot -p123456 -e "FLUSH PRIVILEGES;"
mysql -uroot -p123456 -e "CREATE database homestead;"
mysql -u root -p123456 -e 'USE mysql;GRANT ALL PRIVILEGES ON *.* TO "root"@"%" IDENTIFIED BY "123456" WITH GRANT OPTION;'
service mysql restart
sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf


#installing laravel and adding it to the default path
composer global require "laravel/installer"
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc

#restarting Apache
service apache2 restart