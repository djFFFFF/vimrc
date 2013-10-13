rm ~/.vim/bundle -rf
rm ~/.vimrc

echo "installing Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc

echo "installing plugin using Vundle"
vim +BundleInstall! +BundleClean +q

cd ~
mkdir ycm_build
cd ycm_build

cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/cpp
make ycm_core

cd ~
rm -rf ~/ycm_build

