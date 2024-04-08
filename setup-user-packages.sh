#!/bin/bash
mkdir $HOME/.local/share/nvim/site/pack/plugin/start/ -p

git clone https://github.com/matbme/JABS.nvim.git $HOME/.local/share/nvim/site/pack/plugin/start/JABS.nvim

mkdir $HOME/.config/nvim -p
cp ./nvim-init.lua $HOME/.config/nvim/init.lua

cp ./tmux.conf $HOME/.tmux.conf
