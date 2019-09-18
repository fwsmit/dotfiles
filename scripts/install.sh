#!/bin/sh

# install script for vim c++ programming setup


#git config --global user.email "fw.smit01@gmail.com"
#git config --global user.name "fwsmit"

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
nvim +PluginInstall +qall

##symlinking configuration files to home directory
ln -sv ~/dotfiles/.vimrc ~/.vimrc  # vim config

# neovim config
mkdir -p ~/.config/nvim/
ln -sv ~/dotfiles/init.vim ~/.config/nvim/ # vim config
#ln -sv ./.bashrc ~/.bashrc
ln -sv ~/dotfiles/.gitconfig ~/.gitconfig # git config
# i3 config
# make directory if it doesnt exist yet
mkdir ~/.i3/
ln -sv ~/dotfiles/i3Config ~/.i3/config 
