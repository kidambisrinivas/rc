# Ship your own perl

# Install perlbrew to manage home folder perls
curl -kL http://xrl.us/perlbrewinstall | bash
echo source ~/perl5/perlbrew/etc/bashrc >> $HOME/.bashrc
source ~/perl5/perlbrew/etc/bashrc
perlbrew available

# Install perl 5.18.2 with thread support
perlbrew install perl-5.18.2_WITH_THREADS
perlbrew switch perl-5.18.2
which perl
perl -v

# Install cpanm and some modules
curl -kL http://cpanmin.us | perl - App::cpanminus
cpanm Try::Tiny
cpanm Data::Dumper
cpanm Eixo::Docker
cpanm Mojolicious

# Install linuxbrew
ruby -e "$(wget -O- https://raw.github.com/Homebrew/linuxbrew/go/install)"

# Setup zsh and useful commands
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
