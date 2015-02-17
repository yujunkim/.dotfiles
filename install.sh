echo "vim | start"

echo "vim | link vimrc"
ln -i ~/.dotfiles/vim/.vimrc ~/.vimrc

echo "vim | download vundle"
git clone https://github.com/gmarik/Vundle.vim.git ~/.dotfiles/vim/bundle/Vundle.vim

echo "vim | install plugin"
vim +PluginInstall +qall

echo "vim | end"

echo "tmux | start"
echo "tmux | tmux SHOULD install YOURSELF"
echo "tmux | just link tmux.conf"
ln -i ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "tmux | end"

echo "zsh | start"
echo "zsh | clone oh-my-zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | ZSH=~/.dotfiles/zsh/.oh-my-zsh sh

echo "zsh | link yujun.zsh-theme"
ln -i ~/.dotfiles/zsh/yujun.zsh-theme ~/.dotfiles/zsh/.oh-my-zsh/themes/yujun.zsh-theme

echo "zsh | link zshrc"
ln -i ~/.dotfiles/zsh/.zshrc ~/.zshrc

echo "zsh | end"
