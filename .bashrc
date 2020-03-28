## .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi

if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

add_path_if_exists()
{
    for p in "$@"
    do
        [ -h "$p" ] && p=$(readlink -f "$p")
        [ -d "$p" ] && PATH=$p:${PATH}
    done
}

add_path_if_exists /opt/bin.d/*
add_path_if_exists /opt/bin
add_path_if_exists ~/.local/bin.d/*
add_path_if_exists ~/.local/bin
add_path_if_exists ~/.bin.d/*
add_path_if_exists ~/.bin
add_path_if_exists ~/bin
add_path_if_exists ~/.cargo/bin

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -e 'puts Gem.user_dir')/bin:${PATH}"
fi

PS1='[\u@\h:$PWD]\n\$ '
export PS1

if [ -f /usr/share/git/completion/git-prompt.sh ]
then
    source /usr/share/git/completion/git-prompt.sh
    GIT_PS1_SHOWCOLORHINTS=true

    if [ "${VTE_VERSION:-0}" -ge 3405 ]
    then
        PROMPT_COMMAND='__vte_prompt_command; __git_ps1 "[\u@\h:\w]" "\n\\\$ " " (%s)"'
    else
        PROMPT_COMMAND='__git_ps1 "[\u@\h:\w]" "\n\\\$ " " (%s)"'
    fi
fi

alias ls='ls -Fh --color=auto --group-directories-first'
alias l='ls -l'
alias ll='ls -Al'
alias w='w -s'
alias p='cd ..'
alias df='df -h'
alias du='du -h'
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias less='less -rf'
alias t='telnet'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias rgrep='rgrep --color=auto'
alias pse='ps -eFlH'

export EDITOR=vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -d ~/.dotnet ] && export DOTNET_ROOT=~/.dotnet
