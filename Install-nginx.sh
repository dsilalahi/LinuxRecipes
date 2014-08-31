# enable EPEL repo
sudo su -c 'rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'

# install nginx
sudo yum install -y nginx

# start nginx daemon
sudo service nginx start

# stop nginx daemon
#sudo service nginx start

# restart nginx daemon
#sudo service nginx restart