#!/bin/sh

# install script for vim c++ programming setup

##symlinking vimrc to home directory
ln -sv ~/dotfiles/.vimrc ~/.vimrc
#ln -sv ./.bashrc ~/.bashrc
ln -sv ~/dotfiles/.gitconfig ~/.gitconfig

git config --global user.email "fw.smit01@gmail.com"
git config --global user.name "fwsmit"

##install powerline symbols (airline plugin)
#git clone https://github.com/powerline/fonts.git --depth=1 # clone
#cd fonts
#./install.sh #install
## clean-up a bit
#cd ..
#rm -rf fonts

#install vundle (vim package manager)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#call vundle pluginInstall from the commandline
vim +PluginInstall +qall
