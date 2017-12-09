#!/bin/sh

# install script for vim c++ programming setup

##symlinking vimrc to home directory
ln -sv ./.vimrc ~/.vimrc
ln -sv ./.bashrc ~/.bashrc
ln -sv ./.gitconfig ~/.gitconfig

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

case "$distroname" in
	"Arch Linux") 
		echo "arch";;
	"Ubuntu") 
		echo "ubuntu";;
esac
