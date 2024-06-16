if [[ -n $commands[aws-vault] ]]; then
    alias av="aws-vault"
else
    return 1
fi

# https://github.com/99designs/aws-vault/blob/master/contrib/completions/zsh/aws-vault.zsh

_aws-vault() {
    local i
    for (( i=2; i < CURRENT; i++ )); do
        if [[ ${words[i]} == -- ]]; then
            shift $i words
            (( CURRENT -= i ))
            _normal
            return
        fi
    done

    local matches=($(${words[1]} --completion-bash ${(@)words[2,$CURRENT]}))
    compadd -a matches

    if [[ $compstate[nmatches] -eq 0 && $words[$CURRENT] != -* ]]; then
        _files
    fi
}

if [[ "$(basename -- ${(%):-%x})" != "_aws-vault" ]]; then
    compdef _aws-vault aws-vault
fi