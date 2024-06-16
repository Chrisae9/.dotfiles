#####################
# CHRIS' ZSH CONFIG #
#####################

# Environment Variables
export ZSH="$HOME/.dotfiles/oh-my-zsh"
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export GPG_TTY=$(tty)
export KUBECONFIG=~/.kube/config
export HISTSIZE=10000  # Maximum number of history entries
export SAVEHIST=10000  # Number of history entries to save

# Source Oh My Zsh
ZSH_CUSTOM=~/.dotfiles/custom
ZSH_THEME="simple"
plugins=(git brew direnv kube-ps1 kubectl kubectx zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

bindkey -e

# Custom Aliases
alias chis='ssh chis'
alias appleclean='find . -iname "._*" -delete'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias dotfiles='cd ~/.dotfiles'
alias dc='cd ..'
alias cx='chmod +x'
alias q='exit'
alias ssu='sudo su'
alias sse='sudoedit'
alias se='sudo vim'
alias p='python3'
alias e='vim'
alias ev='vim ~/.vimrc'
alias ez='vim ~/.zshrc'
alias eu='vim ~/.dotfiles/update'
alias uz='~/.dotfiles/update'
alias dot='cd ~/.dotfiles'
alias ezl='vim ~/.zshrc.local'
alias sz='source ~/.zshrc'
alias hz='vim ~/.histfile'
alias sc='vim ~/.ssh/config'
alias dcd='docker compose down'
alias dck='docker compose kill'
alias dcu='docker compose up -d'
alias dcdu='docker compose down && docker compose up -d'
alias code='code -r .'
alias gf='git fetch'
alias gps='git push'
alias gpl='git pull'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gd='git diff'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gst='git stash'
alias gda="git for-each-ref --format '%(refname:short)' refs/heads | grep -v 'master\|main' | xargs git branch -D"
alias gstp='git stash pop'
alias gaa='git add --all'
alias gr='git reset HEAD^'
alias grh='git reset --hard HEAD'
alias grh1='git reset --hard HEAD~1'
alias gdr='echo "dry run" | gpg --clearsign'

# Paths
cdpath+=($HOME)
path+=($HOME/bin)
path+=($HOME/.local/bin)
path+=($HOME/go/bin)

# History Configuration
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate events first when trimming history
setopt HIST_FIND_NO_DUPS       # Do not display previously found event
setopt HIST_IGNORE_ALL_DUPS    # Delete old event if new is duplicate
setopt HIST_IGNORE_DUPS        # Do not record consecutive duplicate events
setopt HIST_IGNORE_SPACE       # Do not record events starting with a space
setopt HIST_SAVE_NO_DUPS       # Do not write duplicate events to history file
setopt INC_APPEND_HISTORY      # Append history incrementally
setopt SHARE_HISTORY

# Kubernetes configurations
if command -v kubectl >/dev/null 2>&1; then
#   source <(kubectl completion zsh)
#   alias k='kubectl'
  alias kx='kubectx'
  alias ke='kubens'
fi

# Alias kubectl to kubecolor only if kubecolor is installed
if command -v kubecolor >/dev/null 2>&1; then
  alias kubectl="kubecolor"
  compdef kubecolor=kubectl
fi

alias list-clusters='aws eks list-clusters'
alias use-cluster='aws eks --region us-east-2 update-kubeconfig --name $1'

function select-cluster {
    clusters=($(aws eks list-clusters --output text --query 'clusters[*]'))
    PS3="Select a cluster: "
    select cluster in "${clusters[@]}"; do
        if [ -n "$cluster" ]; then
            echo "Selected cluster: $cluster"
            export SELECTED_CLUSTER=$cluster
            aws eks --region us-east-2 update-kubeconfig --name "$cluster"
            break
        else
            echo "Invalid selection. Please try again."
        fi
    done
}

# Local device specifics
if [[ -f "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi

# Function to print bold messages
msg() {
    printf "$(tput bold)%s$(tput sgr0)\n" "$*"
}

# Check for internet connectivity if interactive
if [[ $- == *i* ]]; then
    if ping -c 1 -W 1 1.1.1.1 &>/dev/null; then
        ~/.dotfiles/update
    else
        msg "No/slow internet. Update script will not run."
    fi
fi

