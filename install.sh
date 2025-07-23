#!/bin/sh

cd ~
git clone https://github.com/johnpupu/myEnv.git
mv .vimrc .vimrc.yours
mv .vim .vim.yours
mv .tmux.conf .tmux.conf.yours
mv .tmuxr .tmuxr.yours
mv .cshrc .cshrc.yours
mv .tcshrc .tcshrc.yours
mv .svndiff_to_vimdiff .svndiff_to_vimdiff.yours
ln -s myEnv/.vimrc
ln -s myEnv/.vim
ln -s myEnv/.tmux.conf
ln -s myEnv/.tmuxr
ln -s myEnv/.tmux
ln -s myEnv/.cshrc
ln -s myEnv/.svndiff_to_vimdiff
ln -s myEnv/.cshrc .tcshrc
