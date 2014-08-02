# sample provisioning script for vagrant

echo "options single-request-reopen" | sudo tee -a /etc/resolv.conf

# timezone
sudo cp /etc/localtime /etc/localtime.org
sudo cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# proxy
# echo "http_proxy = http://proxy.com:PORT/" | sudo tee -a /etc/wgetrc
# echo "https_proxy = http://proxy.com:PORT/" | sudo tee -a /etc/wgetrc
# echo "proxy = http://proxy.com:PORT/" | sudo tee -a /etc/yum.conf


# add repository
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh epel-release-6-8.noarch.rpm
sudo sed -i".org" -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/epel.repo
rm -rf epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh remi-release-6.rpm
rm -rf remi-release-6.rpm


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
#sudo yum install -y git
wget https://git-core.googlecode.com/files/git-1.9.0.tar.gz
tar xfvz git-1.9.0.tar.gz
cd git-1.9.0
./configure
make
sudo make install
cd ..
rm -rf git-1.9.0
rm git-1.9.0.tar.gz

wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
mv git-completion.bash .git-completion.bash
mv git-prompt.sh .git-prompt.sh


# install vim
sudo yum install -y vim
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

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

# install node.js(nvm)
#git clone git://github.com/creationix/nvm.git ~/.nvm
#echo . ~/.nvm/nvm.sh >> ~/.bash_profile
#echo 'export PATH="$HOME/.nvm/bin:$PATH"' >> ~/.bash_profile
#source ~/.bash_profile
#nvm install v0.10.30
#nvm use "v0.10.30"

# install node.js(nodebrew)
wget git.io/nodebrew
perl nodebrew setup
echo 'export PATH="$HOME/.nodebrew/current/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
nodebrew install-binary stable
nodebrew use v0.10.30

# install go
wget http://golang.org/dl/go1.3.linux-amd64.tar.gz
tar -C $HOME -xzf go1.3.linux-amd64.tar.gz
rm -rf go*.tar.gz
echo 'export GOROOT="$HOME/go"' >> ~/.bash_profile
source ~/.bash_profile
echo 'export PATH="$GOROOT/go/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

