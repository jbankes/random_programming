#!/bin/bash

MVN_VER="3.5.2"
MVN_DIR=apache-maven-$MVN_VER
MVN_TAR=$MVN_DIR-bin.tar.gz

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



