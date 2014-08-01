# sample provisioning script for vagrant

echo "options single-request-reopen" | sudo tee -a /etc/resolv.conf

# proxy
# echo "http_proxy = http://proxy.com:PORT/" | sudo tee -a /etc/wgetrc
# echo "https_proxy = http://proxy.com:PORT/" | sudo tee -a /etc/wgetrc
# echo "proxy = http://proxy.com:PORT/" | sudo tee -a /etc/yum.conf


# add repository
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh epel-release-6-8.noarch.rpm
sudo sed -i".org" -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/epel.repo
rm -rf -Uvh epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh remi-release-6.rpm
rm -rf -Uvh remi-release-6.rpm


sudo yum update -y
sudo yum install -y man

# install httpd
sudo yum install -y httpd
sudo service httpd start
sudo chkconfig httpd on
sudo rm -rf /var/www/html
sudo ln -fs /vagrant /var/www/html

# desable firewall
sudo service iptables stop
sudo chkconfig iptables off

# install git
sudo yum install -y zlib-devel perl-devel gettext gcc curl-devel
wget https://git-core.googlecode.com/files/git-1.9.0.tar.gz
tar xfvz git-1.9.0.tar.gz
cd git-1.9.0
./configure
make
sudo make install
cd ..
rm -rf git-1.9.0
rm git-1.9.0.tar.gz

# install openssl
sudo yum install -y openssl openssl-devel

# install ruby
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.1.2
rbenv rehash
rbenv global 2.1.2
gem update --system

# install rails
gem install rails --no-ri --no-rdoc -V
rbenv rehash

# install node.js
git clone git://github.com/creationix/nvm.git ~/.nvm
echo . ~/.nvm/nvm.sh >> ~/.bash_profile
echo 'export PATH="$HOME/.nvm/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
nvm install v0.10.30
nvm use "v0.10.30"

