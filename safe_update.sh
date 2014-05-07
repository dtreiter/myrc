git pull

# backup dotfiles
if [ -e ~/.vimrc ]
then
  cp ~/.vimrc ~/.vimrc.backup
  echo "backed up ~/.vimrc"
fi
if [ -d ~/.vim ]
then
  cp -r ~/.vim ~/.vim.backup
  echo "backed up ~/.vim/"
fi
cp -r .vim* ~

if [ -e ~/.tmux.conf ]
then
  cp ~/.tmux.conf ~/.tmux.conf.backup
  echo "backed up ~/.tmux.conf"
fi
cp .tmux.conf ~
