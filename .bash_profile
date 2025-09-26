#
# ~/.bash_profile
#

#[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="/home/kangaroo/.ghcup/bin:$PATH"


# write content below into ~/.profile, or ~/.bash_profile

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

