PROMPT='%{$fg[blue]%}[%{$reset_color%}%{$fg[magenta]%}%~%{$reset_color%}%{$fg[blue]%}]%{$reset_color%} $(extra)
 %{$fg[blue]%}>%{$reset_color%} '
RPROMPT='$(git_prompt_info)'

function extra {
    if [[ -n "$AWS_VAULT" ]]; then
        echo "%{$fg[yellow]%}[ %{$reset_color%}%{$fg[red]%}$AWS_VAULT%{$reset_color%} %{$fg[yellow]%}]%{$reset_color%} "
        echo "%{$fg[yellow]%}[ %{$reset_color%}%{$fg[red]%}$(kube_ps1)%{$reset_color%} %{$fg[yellow]%}]%{$reset_color%}"

    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"