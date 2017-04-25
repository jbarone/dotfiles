alias ls='ls -G'
alias ll='ls -FGlAhp'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.bin" ]; then
  PATH="$HOME/.bin:$PATH"
fi

_not_inside_tmux() {
    [[ -z "$TMUX" ]]
}

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git "$@"
  else
    git status -sb
  fi
}

# Complete g like git
__git_complete g __git_main

__prompt_command() {
    local EXIT="$?"

    local Blue='\[\e[1;36m\]'
    local Yellow='\[\e[33m\]'
    local Red='\[\e[1;31m\]'
    local Green='\[\e[1;32m\]'
    local Reset='\[\e[0m\]'

    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUPSTREAM=true

    PS1="${Blue}\u@\h ${Yellow}\w${Red}$(__git_ps1 " %s")\n"
    if [ $EXIT != 0 ]; then
        PS1+="${Red}\$"
    else
        PS1+="${Green}\$"
    fi

    PS1+="${Reset} "
}

export GOPATH=$HOME/go
export PATH=/usr/local/share/python:$PATH:$GOPATH/bin

export PROMPT_COMMAND=__prompt_command

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
source /usr/local/bin/virtualenvwrapper.sh

export EDITOR='vim'

eval $(thefuck --alias)
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
