#!/bin/sh

# ubuntu install script for vim c++ programming setup

#sudo apt-get update
#sudo apt-get upgrade

##symlinking vimrc to home directory
#ln -s .vimrc ~/.vimrc


#if haveProg apt-get ; then echo "apt";
#fi

arch=$(uname -m)
kernel=$(uname -r)
if [ -n "$(command -v lsb_release)" ]; then
	distroname=$(lsb_release -s -d)
elif [ -f "/etc/os-release" ]; then
	distroname=$(grep PRETTY_NAME /etc/os-release | sed 's/PRETTY_NAME=//g' | tr -d '="')
elif [ -f "/etc/debian_version" ]; then
	distroname="Debian $(cat /etc/debian_version)"
elif [ -f "/etc/redhat-release" ]; then
	distroname=$(cat /etc/redhat-release)
else
	distroname="$(uname -s) $(uname -r)"
fi

echo "${distroname}"

if [ "$distroname" == "Arch Linux" ]; then
	echo "arch"
fi
