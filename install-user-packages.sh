#!/bin/bash

sudo apt update
sudo apt upgrade

# general purpose packages
general='neovim tmux neofetch tldr fzf'

# C development
C_devel='cmake build-essential'

echo "installing general purpose packages like, $general"
sudo apt install $general

echo "installing C development related packages like, $C_devel"
sudo apt install $C_devel

echo "creating rust dev environment..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"            # For sh/bash/zsh/ash/dash/pdksh

echo "creating go dev environment..."
echo "downloading go version 1.22.2..."
wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz

echo "installing go version 1.22.2..."
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile
source $HOME/.profile

echo "logout and log back in for changes to take effect..."
exit
