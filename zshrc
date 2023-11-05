#####################
# CHRIS' ZSH CONFIG #
#####################


#COMPINSTALL
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/chris/.zshrc'
autoload -Uz compinit; autoload -U colors && colors; compinit

eval "$(direnv hook zsh)"

#PATH
setopt auto_cd
cdpath+=($HOME)
cdpath+=(/hdd)
path+=($HOME/bin)
path+=($HOME/.local/bin)
path+=($HOME/gems/bin)
path+=($HOME/go/bin)
path+=(/snap/bin)
path+=($HOME/.deno/bin)
GEM_HOME=($HOME/gems)
PKG_CONFIG_PATH=("/usr/lib/pkgconfig")

#ENVIRONMENT VARIABLES
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export GPG_TTY=$(tty)

#BINDS
bindkey "^R" history-incremental-search-backward #ctrl+r search through zsh history
bindkey -e

#################
# ALIAS SECTION #
#################

#WAKE ON LAN
alias wakey='wakeonlan 04:92:26:d8:07:73'

##SSH
alias chis='ssh chis'
alias appleclean='find . -iname "._*" -delete'

##SHORCUTS
alias ls='ls --color=auto'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias q='exit'

#directory operations
alias dot='cd $HOME/.dotfiles'
alias d='/hdd'
alias dc='cd ..'
alias pu='pushd'
alias po='popd'

#sudo
alias ssu='sudo su'
alias sse='sudoedit'

#EDITING
alias se='sudo vim'
alias ee=' emacs -nw'
alias e='vim'
alias v='vim'
alias vi='vim'
alias vim='vim'
alias p='python3'
alias ev='vim ~/.vimrc'
alias ez='vim ~/.zshrc'
alias ezl='vim ~/.zshrc.local'
alias sz='source ~/.zshrc'
alias hz='vim ~/.histfile'
alias sc='vim ~/.ssh/config'

#GIT
alias gf='git fetch'
alias gps='git push'
alias gpu='git pull'
alias gs='git status'
alias ga='git add --all'
alias gr='git reset --hard HEAD'
alias gc='git commit'
alias gpg-dry-run='echo "dry run" | gpg --clearsign'

#OTHER
alias javaselect='sudo update-alternatives --config java'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
alias dp='sudo du -h --max-depth=1'

#TERMINAL COLOR
PROMPT="%F{yellow}($SHLVL)%f %F{61}$USERNAME%f%F{silver}|%f%F{cyan}%~%f%F{silver}|%f%F{61}$%f " 


#enable color support of ls and also add handy aliases

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


#SAVE COMMAND HISTORY
setopt HIST_IGNORE_SPACE
export HISTSIZE=10000  # history size
export SAVEHIST=10000  # history size after logout
export HISTFILE=$HOME/.histfile
setopt INC_APPEND_HISTORY  # Append into history
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY  # Save timestamp for history entries



#USE .zshrc.local 
#FOR LOCAL DEVICE SPECIFICS
if [[ -f "$HOME"/.zshrc.local ]]
then
    source $HOME/.zshrc.local
fi

# NVIM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -U +X bashcompinit && bashcompinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chris/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chris/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chris/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chris/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

