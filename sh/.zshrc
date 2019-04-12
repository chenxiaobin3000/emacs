# Path to your oh-my-zsh installation.
export ZSH=/Users/chenxiaobin/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="steeef"

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

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# my bash config
# emacs C-x f
if [ -n "$INSIDE_EMACS" ]; then
    chpwd() { print -P "\033AnSiTc %d" }
    print -P "\033AnSiTu %n"
    print -P "\033AnSiTc %d"
fi

# alias
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias scpr='rsync -P --rsh=ssh'
alias emacsstart='emacs --daemon'
alias emacsoff="emacsclient -e '(save-buffers-kill-emacs)'"
alias emacsnew='emacsclient -n -c -a emacs "$@" >/dev/null 2>&1 &'
alias nginxstart='sudo nginx'
alias nginxoff='sudo nginx -s stop'
alias nginxrestart='sudo nginx -s reload'
alias javacheck='ps -ef | grep java'
alias phpstart='php-fpm -D'
alias redisstart='redis-server /usr/local/etc/redis.conf'
alias redisoff='redis-cli shutdown'
alias tomcatstart='cd /usr/local/tomcat/bin && ./catalina.sh jpda start && cd $OLDPWD'
alias tomcatoff='cd /usr/local/tomcat/bin && ./shutdown.sh && cd $OLDPWD'
alias tomcattail='tail -f /usr/local/tomcat/logs/catalina.out'

# path
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/Documents/go

PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# homebrew
PATH=/usr/local/sbin:$PATH

export SVN_EDITOR=/usr/local/bin/emacs
export GIT_EDITOR=/usr/local/bin/emacs

export PATH
