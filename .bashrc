#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export XKB_DEFAULT_OPTIONS=caps:escape
alias config='/usr/bin/git --git-dir=/home/archrat/.cfg/ --work-tree=/home/archrat'
alias config='/usr/bin/git --git-dir=/home/archrat/.cfg/ --work-tree=/home/archrat'
