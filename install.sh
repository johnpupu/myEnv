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
ln -s /root/myEnv/.vimrc
ln -s /root/myEnv/.vim
ln -s /root/myEnv/.tmux.conf
ln -s /root/myEnv/.tmuxr
ln -s /root/myEnv/.tmux
ln -s /root/myEnv/.cshrc
ln -s /root/myEnv/.svndiff_to_vimdiff
ln -s /root/myEnv/.cshrc .tcshrc
# zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
ln -s /root/myEnv/.zshrc ~
ln -s /root/myEnv/.p10k.zsh ~
ln -s /root/myEnv/.oh-my-zsh/custom/plugins/tronice ~/.oh-my-zsh/custom/plugins
chsh -s /bin/zsh
