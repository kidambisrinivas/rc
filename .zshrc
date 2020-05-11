
export PATH="$HOME/.linuxbrew/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
export PATH="$HOME/perl5/perlbrew/bin:$HOME/perl5/perlbrew/perls/perl-5.18.2_WITH_THREADS/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH=/usr/local/bin:$PATH
# export PATH=/Users/srinivas/miniconda2/bin:$PATH
export PATH=$HOME/miniconda3/bin:$PATH
# export TCL_LIBRARY=/Users/srinivas/miniconda2/lib/tcl8.5/init.tcl
# export TK_LIBRARY=/Users/srinivas/miniconda2/lib/tcl8.5/init.tcl
export TCL_LIBRARY=$HOME/miniconda3/lib/tcl8.5/init.tcl
export TK_LIBRARY=$HOME/miniconda3/lib/tcl8.5/init.tcl

alias brc="source ~/.bashrc"
alias zrc="source ~/.zshrc"
alias vrc="vim ~/.zshrc"
alias psg="ps -afe | grep "
dm() {
    grep -R "^\s*use [a-zA-Z]" . | grep -v -P "strict|warnings| lib|utf8" | perl -nle 'print "requires \"".$1."\";" if /.*?use ([^\;]+?)(?:\s*qw[^\;]+|\s+[^\w][\w\:\-]+[^\w])*\;/' | sort | uniq
}
alias disk="ls | xargs du -hs | sort --human-numeric-sort"
export TERM=xterm-256color
# [ -n "$TMUX" ] && export TERM=screen-256color
# alias vim="/usr/local/Cellar/vim/7.4.2290/bin/vim"
source $HOME/.gvm/scripts/gvm
source ~/opt/local/pinto/etc/bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#alias tmux="env TERM=xterm-256color tmux"
#
sshw () {
        if [ -n "$1" ]
        then
                ssh sem3@`grep -m $2 $1 /etc/hosts | tail -n 1 | awk '{print $1}' | xargs -I % curl -XGET "$HOST:4101/drones/meta/%" | jq -r '.drone.local_ip'`
        else
                echo "ERROR: Search term is blank!"
        fi
}
alias ssh3f='nocorrect ssh -i ~/.ssh/MyKey.pem  -o StrictHostKeyChecking=no -o ServerAliveInterval=240 -l ubuntu'
alias ssh3f2='nocorrect ssh -i ~/.ssh/MyKey.pem  -o StrictHostKeyChecking=no -o ServerAliveInterval=240 -l ubuntu'

# Miniconda path
# export PATH="/home/harik/miniconda3/bin:$PATH"

source /usr/share/autojump/autojump.zsh
alias brew=$HOME/.linuxbrew/bin/brew
[[ -s `/home/srinivas/.linuxbrew/bin/brew --prefix`/etc/autojump.sh ]] && . `$HOME/.linuxbrew/bin/brew --prefix`/etc/autojump.sh
