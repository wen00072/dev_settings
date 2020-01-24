#!/bin/bash
sudo apt update && sudo apt install aptitude && sudo aptitude upgrade -y --full-resolve

sudo apt install -y build-essential bison flex automake libtool intltool  libncurses5-dev git-svn tig meld cscope vim-gtk fonts-inconsolata geany joe doxygen-gui exuberant-ctags manpages-dev manpages-posix-dev minicom tree terminator ttf-mscorefonts-installer ack-grep pandoc gnome-system-tools ghex mc dict wireshark mtr pdfgrep sshfs fail2ban rkhunter bc libssl-dev cmake gdb libatk-adaptor libgail-common
