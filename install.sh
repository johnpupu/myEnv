#!/bin/sh

cd ~
git clone https://github.com/johnpupu/myEnv.git
mv .vimrc .vimrc.yours
mv .vim .vim.yours
ln -s myEnv/.vimrc
ln -s myEnv/.vim
ln -s myEnv/.tmux.conf
ln -s myEnv/.tmuxr
ln -s myEnv/.cshrc
