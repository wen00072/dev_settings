#!/bin/bash
cp ../vim/vimrc ~/.vimrc
cd
sudo apt-get install -y exuberant-ctags cscope vim-gtk git flake8 python-rope pylint
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/powerline/fonts
cd fonts && ./install.sh
