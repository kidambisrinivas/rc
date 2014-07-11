#!/usr/bin/env bash

# This script will at least take 40 minutes to complete
# Installing perl takes >~20 mins (to compile and install)

# 0. Clean messed up installation
curl https://raw.githubusercontent.com/kidambisrinivas/rc/master/cleanMessedUpInstallation.sh | sh
source ~/.bashrc

# 1. Ship your own perl

# 1.1 Install perlbrew to manage home folder perls
curl -kL http://xrl.us/perlbrewinstall | bash
echo "source ~/perl5/perlbrew/etc/bashrc" >> $HOME/.bashrc
source ~/perl5/perlbrew/etc/bashrc
source ~/.bashrc
perlbrew available

# 1.2 Install perl 5.18.2 with thread support
perlbrew install perl-5.18.2_WITH_THREADS
perlbrew switch perl-5.18.2
which perl
perl -v

# 1.3 Install cpanm and some modules
curl -kL http://cpanmin.us | perl - App::cpanminus
cpanm Try::Tiny
cpanm Data::Dumper
cpanm Eixo::Docker

# 2. Install linuxbrew
ruby -e "$(wget -O- https://raw.github.com/Homebrew/linuxbrew/go/install)"
echo "export PATH=\"\$HOME/.linuxbrew/bin:\$PATH\"" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\"\$HOME/.linuxbrew/lib:\$LD_LIBRARY_PATH\"" >> ~/.bashrc
source ~/.bashrc

# 2.1 Setup zsh and useful commands
brew install zsh
curl -L http://install.ohmyz.sh | sh
brew install autojump
sed -i -e '1i[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh\' ~/.zshrc
sed -i -e '1isource ~/.bashrc\' ~/.zshrc

echo "\n# Useful aliases\n" >> ~/.zshrc
echo "alias brc=\"source ~/.bashrc\"" >> ~/.zshrc
echo "alias zrc=\"source ~/.zshrc\"" >> ~/.zshrc
echo "alias psg=\"ps -afe | grep \"" >> ~/.zshrc
echo "alias ngrok=\"~/packages/ngrok/ngrok \"" ~/.zshrc

echol "\n# Useful functions\n" >> ~/.zshrc
echo "dm() {" >> ~/.zshrc
echo "    grep -R \"^\s*use [a-zA-Z]\" . | grep -v -P \"strict|warnings| lib|utf8\" | perl -nle 'print \"requires \\\"\".\$1.\"\\\";\" if /.*?use ([^\;]+?)(?:\s*qw[^\;]+|\s+[^\w][\w\:\-]+[^\w])*\;/' | sort | uniq" >> ~/.zshrc
echo "}" >> ~/.zshrc

# 3. Setup screen
cd $HOME
rm -f ~/.screenrc
wget "https://raw.githubusercontent.com/kidambisrinivas/rc/master/.screenrc"

# 4. Setup vim

# 4.1 Install Vundle
mkdir -p $HOME/.vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd $HOME/.vim/
wget "https://github.com/kidambisrinivas/rc/blob/master/col.zip"
unzip col.zip
rm -f col.zip

# 4.2 Get vimrc
cd $HOME
wget "https://raw.githubusercontent.com/kidambisrinivas/rc/master/.vimrc"

# 4.3 Setup all plugins
cd $HOME/.vim/
wget "https://raw.githubusercontent.com/kidambisrinivas/rc/master/plugins.vim" 
vim +PluginInstall +qa
echo "\n\n"
cd $HOME/.vim/bundle/YouCompleteMe/
./install.sh
echo "\n\n"
cd $HOME/.vim/bundle/ultisnips/
git clone "https://github.com/honza/vim-snippets"
cd $HOME/.vim/bundle/ultisnips/vim-snippets/Ultisnips/
rm -f perl.snippets
wget "https://raw.githubusercontent.com/kidambisrinivas/rc/master/perl.snippets"
vim +PluginInstall +qa
echo "\n\n"

echo "Home Sweet home!"
