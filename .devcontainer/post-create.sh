#!/bin/bash

# this runs at Codespace creation - not part of pre-build

echo "$(date)    post-create start" >> ~/status

#curl -s "https://get.sdkman.io" | bash
source /usr/local/sdkman/bin/sdkman-init.sh
sdk install springboot

wget https://aka.ms/download-jdk/microsoft-jdk-17.0.8-linux-x64.tar.gz -O  /tmp/microsoft-jdk-17.0.8-linux-x64.tar.gz
sudo tar -xvf /tmp/microsoft-jdk-17.0.8-linux-x64.tar.gz  --directory /opt
export JAVA_HOME=/opt/jdk-17.0.8+7/
export PATH=$JAVA_HOME/bin:$PATH

sudo apt update
sudo apt install -y make
sudo apt install -y httpie
sudo apt install -y apt-transport-https

echo "$(date)    post-create stop" >> ~/status