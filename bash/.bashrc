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

export GOPATH=$HOME/go
export PATH=/usr/local/share/python:$PATH:$GOPATH/bin

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=true
export PS1='\[\e[1;36m\]\u@\h \[\e[33m\]\w\[\e[1;31m\]$(__git_ps1 " %s")\n\[\e[1;32m\]\$\[\e[0m\] '

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
source /usr/local/bin/virtualenvwrapper.sh

export EDITOR='vim'

eval $(thefuck --alias)
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
