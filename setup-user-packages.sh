#!/bin/bash

# installing neovim from source
#
# installing neovim dependencies
sudo apt-get install ninja-build gettext cmake unzip curl build-essential

# build neovim from source
mkdir $HOME/Repos -p
git clone --depth=1 https://github.com/neovim/neovim $HOME/Repos/neovim
cd $HOME/Repos/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
git checkout stable
sudo make install

# setup JABS.nvim plugin
mkdir $HOME/.local/share/nvim/site/pack/plugin/start/ -p
git clone https://github.com/matbme/JABS.nvim.git $HOME/.local/share/nvim/site/pack/plugin/start/JABS.nvim

# create nvim config
mkdir $HOME/.config/nvim -p
cp ./nvim-init.lua $HOME/.config/nvim/init.lua

# create tmux config
cp ./tmux.conf $HOME/.tmux.conf
