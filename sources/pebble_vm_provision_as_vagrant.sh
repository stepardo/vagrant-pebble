#!/bin/bash

PEBBLE_SDK=pebble-sdk-4.5-linux64

echo "---------------------------------------------------"
echo "                 Start as vagrant                  "
echo "---------------------------------------------------"

echo "---------------------------------------------------"
echo "          Starting to Build Pebble Stuff           "
echo "---------------------------------------------------"
mkdir -p /home/vagrant/pebble-dev
cd /home/vagrant/pebble-dev
echo "---------------------------------------------------"
echo "              Getting the pebble sdk               "
echo "---------------------------------------------------"
wget -q -a /vagrant/pebble.log https://s3.amazonaws.com/assets.getpebble.com/pebble-tool/$PEBBLE_SDK.tar.bz2

tar -xf $PEBBLE_SDK.tar.bz2
rm $PEBBLE_SDK.tar.bz2
chown -R vagrant:vagrant /home/vagrant/pebble-dev
echo "---------------------------------------------------"
echo "                Setting up profile                 "
echo "---------------------------------------------------"
echo "export PATH=/home/vagrant/pebble-dev/$PEBBLE_SDK/bin:\$PATH" >> /home/vagrant/.profile
cd /home/vagrant/pebble-dev/$PEBBLE_SDK
echo "---------------------------------------------------"
echo "               Getting ubuntu tools                "
echo "---------------------------------------------------"
wget -q -a /vagrant/pebble.log http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk/arm-cs-tools-ubuntu-universal.tar.gz
tar -zxf arm-cs-tools-ubuntu-universal.tar.gz
echo "---------------------------------------------------"
echo "            Setting up using virtualenv            "
echo "---------------------------------------------------"
virtualenv --no-site-packages .env
source .env/bin/activate
echo "---------------------------------------------------"
echo "            Pip installing requirements            "
echo "---------------------------------------------------"
pip install -r requirements.txt
deactivate
echo "---------------------------------------------------"
echo "                       Done!                       "
echo "---------------------------------------------------"
