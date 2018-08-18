# The following lines were added by compinstall

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit
autoload -U colors && colors
compinit


# Save command history
export HISTSIZE=10000  # history size
export SAVEHIST=10000  # history size after logout
export HISTFILE=~/.histfile
setopt INC_APPEND_HISTORY  # Append into history
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY  # Save timestamp for history entries

# Search command history
bindkey "^R" history-incremental-search-backward

#bindkey -v
# End of lines configured by zsh-newuser-install

setopt auto_cd
cdpath+=($HOME)
path+=($HOME/bin)
path+=("/opt/idea-IU-idea-IU-182.3911.36"/bin)
path+=("/opt/android-studio"/bin)
PKG_CONFIG_PATH=("/usr/lib/pkgconfig")

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

# some more aliases
alias sudo='sudo '
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ssu='sudo su'

alias journal='journalctl -p 3 -xb'
alias sysfail='systemctl --failed'
alias webkill='sudo ip link set wlp1s0 down'
alias javaselect='sudo update-alternatives --config java'

alias mason='ssh mason'
alias zeus='ssh zeus'

alias per='chmod +x'
alias se='sudoedit'
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
alias scripts='cd /usr/local/bin/'
alias na='nautilus .'
alias sna='sudo nautilus .'

#Terminal color

PS1="%{$fg[red]%}chris%{$reset_color%}%{$fg[yellow]%}|%{$reset_color%}%{$fg[cyan]%}%~%{$fg[yellow]%}|%{$reset_color%}%{$fg[red]%}$%{$reset_color%} "

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

#Launch X apps on Chrome OS
export DISPLAY=:0
