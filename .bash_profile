#
# ~/.bash_profile
#

#[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="${HOME}/.ghcup/bin:$PATH"

export SUDO_EDITOR=/usr/bin/nvim

# write content below into ~/.profile, or ~/.bash_profile

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

