#!/bin/bash

# Maven Vars
MVN_VER="3.5.2"
MVN_DIR=apache-maven-$MVN_VER
MVN_TAR=$MVN_DIR-bin.tar.gz

# Bamboo Vars
BAMBOO_VER="6.3.2"
BAMBOO_DIR=atlassian-bamboo-$BAMBOO_VER
BAMBOO_TAR=$BAMBOO_DIR.tar.gz
BAMBOO_CONFIG=/usr/bin/$BAMBOO_DIR/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties
BAMBOO_INSTALL=/usr/bin/$BAMBOO_DIR

# install Java
sudo yum install java-1.8.0-openjdk-devel -y 

# install Maven; thanks to https://www.vultr.com/docs/how-to-install-apache-maven-3-5-on-centos-7
cd /home/vagrant
if [ ! -d "$MVN_DIR" ]; then
  wget http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/$MVN_VER/binaries/$MVN_TAR
  tar -zxvf $MVN_TAR
  rm $MVN_TAR
fi

mv /home/vagrant/$MVN_DIR /opt
chown -R root:root /opt/$MVN_DIR
ln -s /opt/$MVN_DIR /opt/apache-maven
echo 'export PATH=$PATH:/opt/apache-maven/bin' | sudo tee -a /etc/profile

# install bamboo
if [ ! -d "$BAMBOO_DIR" ]; then
  wget https://www.atlassian.com/software/bamboo/downloads/binary/$BAMBOO_TAR
  tar -zxvf $BAMBOO_TAR
  rm $BAMBOO_TAR
fi

mv /home/vagrant/$BAMBOO_DIR $BAMBOO_INSTALL
mkdir /var/lib/bamboo-home
echo "bamboo.home=/var/lib/bamboo-home" > $BAMBOO_CONFIG
chown -R vagrant:vagrant $BAMBOO_CONFIG
chown -R vagrant:vagrant $BAMBOO_INSTALL

