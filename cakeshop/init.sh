#!/bin/bash

if [[ -z $1 ]]; then
	echo "Please pass the ip address of your geth instance to this script"
	echo "Usage: ./init.sh 52.223.34.255"
	exit 1
fi

GETH_IP=$1
wget "https://github.com/jpmorganchase/cakeshop/releases/download/0.9.1/cakeshop-0.9.1-x86_64-linux.war"
mv cakeshop-* cakeshop.war
java -jar cakeshop.war example
sed -i -e "s@geth.url=http:\://localhost@geth.url=http:\://$GETH_IP@g" "data/local/application.properties"
java -jar cakeshop.war 2>>cakeshop.log &
