# Using grml for zsh functions and addons.
# It's super fast unlike oh-my-zsh.
# ALIASES
# --------------------------------
alias rg="/usr/bin/rg"

# Editor stuff
alias v="/usr/bin/nvim"
alias neo="/usr/bin/nvim"
# alias nvim="emacsclient -t"
# alias vim="emacsclient -t"
alias e="emacsclient -c"
alias szh="source ~/.zshrc"

# Prefix stuff like ag and grep
alias -g A='| ag'
alias -g G='| grep'
alias -g L='| less'

# Github stuff
alias gs='git status'
alias gc='git commit'
alias gad='git add --all .'
alias gag='git add . && git commit --amend --no-edit && git push -f'
alias gbc='gdc'
alias gca='git commit -a'
alias gcaa='git commit -a --amend -C HEAD'
alias gcl='git clone'
alias gcm="git commit -m"
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdm='git diff master'
alias gg='git lg'
alias gp='git push'
alias gpf='git push -f'
alias gpr='git pull --rebase'
alias grc='git rebase --continue'

# Ruby stuff
alias rials='rails'
alias rs='rails s'
alias rc='rails c'
alias deploy='bundle exec cap staging deploy'
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'

# Racket
alias rktrepl='racket -il xrepl'

# Utility
alias audio='pulseaudio -k && sudo alsa force-reload'
alias sound='pulseaudio -k && sudo alsa force-reload'

# XCLIP
alias clipin="xclip -i -selection clipboard"
alias clipout="xclip -o -selection clipboard"

# SSH
alias vpn="sshuttle --dns -D -x 77.246.208.12 -r njichev@77.246.208.12 0/0"

# Browser
alias chrome="google-chrome-stable"
# --------------------------------
# FUNCTIONS 
# --------------------------------
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# eval "$(rbenv init -)"

# PATH="/home/njichev/bin:$PATH"
# export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.pyenv/:$PATH"

eval "$(jump shell zsh)"

# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --color "always"'

export FZF_DEFAULT_COMMAND='/usr/bin/rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

eval "$(direnv hook zsh)"

alias timewalk="git log -p --"
alias wip="git add . and; git commit -mWIP"

alias tmn="tmux new-session -s"
alias tma="tmux attach -t"
alias tmd="tmux detach"
alias tmk="tmux kill-session -t"

alias vim="vim -u NONE"
alias bop="bundle open"
alias killrails="kill -9 $(lsof -i tcp:3000 -t)"


export EDITOR='nvim'
source /usr/share/nvm/init-nvm.sh

# Python
alias pmt="py.test --reuse-db --tb=native -s"
alias pms="python manage.py shell"
alias pmr="python manage.py runserver"
alias pm="python manage.py"
alias pmm="python manage.py migrate"
alias pmmm="python manage.py makemigrations"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate;
fi

if [[ -n "$TMUX" ]]; then
    tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
fi

export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/bin/virtualenvwrapper.sh

alias da="direnv allow"
alias vim="nvim"
