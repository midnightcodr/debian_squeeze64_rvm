#!/usr/bin/env bash
# some stuff that will bite you later if you skip
apt-get -y -V install curl autoconf automake autotools-dev bison build-essential bzip2 curl gcc git git-core libapr1-dev libaprutil1-dev libc6-dev libcurl4-openssl-dev libmysqlclient-dev libncurses5-dev libopenssl-ruby libreadline6 libreadline6-dev libruby libsqlite3-0 libsqlite3-dev libssl-dev libtool libxml2-dev libxslt-dev libyaml-dev make ncurses-dev openssl sqlite3 zlib1g zlib1g-dev zlibc

# install latest stable ruby
curl -L https://get.rvm.io | bash -s stable --ruby
source /etc/profile.d/rvm.sh

# will be needed to install rails
rvm --verify-downloads 1 pkg install zlib openssl
rvm reinstall all --force
rvm --default use 1.9.3

# install latest stable rails
curl -L https://get.rvm.io | bash -s stable --rails
source /usr/local/rvm/scripts/rvm

# javascript vm
cd /tmp
wget -O - http://nodejs.org/dist/v0.8.14/node-v0.8.14-linux-x64.tar.gz|tar xz
cd node-v0.8.14-linux-x64
rm ChangeLog README.md LICENSE
rsync -a . /usr/local
cd /tmp
rm -rf node-v0.8.14-linux-x64/

# this solves the super slow problem when running dev server on LAN
sed -i 's/:DoNotReverseLookup => nil/:DoNotReverseLookup => true/' /usr/local/rvm/rubies/ruby-1.9.3-p286/lib/ruby/1.9.1/webrick/config.rb
