# The following lines were added by compinstall

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
bindkey -v
# End of lines configured by zsh-newuser-install

setopt auto_cd
cdpath=($HOME)


# some more aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ssu='sudo su'

alias mason='ssh mason'
alias zeus='ssh zeus'

alias e='nvim'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vv='v ~/.vimrc'
alias task='gnome-system-monitor'
alias settings='gnome-control-center'
alias gnome='gnome-tweak-tool'
alias vshell='v ~/.zshrc'
alias sshell='source ~/.zshrc'
alias hshell='v ~/.histfile'

alias gpath='cd /usr/share/gnome-shell/extensions'
alias na='nautilus .'
alias sna='sudo nautilus .'

alias mountboot='sudo mount /dev/sda2 /mnt/boot'

#Terminal color
PS1='%F{yellow}|%f%F{red}ᗑ %f%F{yellow}|%f %F{cyan}%~%f %F{yellow}|%f%F{red}ᗑ %f%F{yellow}|%f %F{cyan}»%f %F{yellow}'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#environmental variables
export EDITOR='nvim'
export VISUAL='nvim'

