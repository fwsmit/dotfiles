#!/bin/sh

# ubuntu install script for vim c++ programming setup

#symlinking vimrc to home directory
ln -s .vimrc ~/.vimrc


#distro detection
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
		echo "installing for arch"
		;;
	"Ubuntu"*) 
		echo "installing for ubuntu"
		sudo add-apt-repository --assume-yes ppa:texus/tgui-0.7
		sudo apt-get update --assume-yes
		sudo apt-get upgrade --assume-yes
		sudo apt-get install --assume-yes cmake git g++ libarmadillo-dev libsfml-dev libtgui-dev curl vim
		;;
esac

git config --global user.email "fw.smit01@gmail.com"
git config --global user.name "fwsmit"

#install vundle (vim package manager)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#call vundle pluginInstall from the commandline
vim +PluginInstall +qall

#notes :
#installed newer version of vim for color support on ubuntu
#should do a compile of vim
