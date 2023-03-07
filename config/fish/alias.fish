alias mkdir "mkdir -p"
alias untar "tar -xzvf"

abbr -a c cc
abbr -a k make
abbr -a v valgrind
abbr -a n nvim

# Shortcuts for rails, grunt, make, docker and git.
abbr -a r rails
abbr -a d docker
abbr -a g git
abbr -a gg git lg
abbr -a da direnv allow
abbr -a m mix
abbr -a mr mix run --no-halt
abbr -a mc mix compile
abbr -a mdc mix deps.compile
abbr -a mg mix deps.get
abbr -a ie iex -S mix
abbr -a i iex

# Bundler abbrs
abbr -a b bundle
abbr -a be bundle exec
abbr -a bi bundle install
abbr -a bop bundle open

# Tmux related shortcuts
abbr -a t tmux
abbr -a tmn tmux new-session -s
abbr -a tma tmux attach -t
abbr -a tmd tmux detach
abbr -a tmk tmux kill-session -t

# Rails related shortcuts
abbr -a rt rails test
abbr -a rc rails console
abbr -a rs rails server
alias rials "rails"
alias riasl "rails"
alias raisl "rails"

# Python shortcuts
abbr -a p python
abbr -a pm python manage.py
abbr -a pmm python manage.py migrate
abbr -a pmmm python manage.py makemigrations
abbr -a pmr python manage.py runserver
abbr -a pms python manage.py shell_plus

# Git subcommands shortcuts.
abbr -a g git
abbr -a gc git commit
abbr -a gco git checkout
abbr -a gcp git cherry-pick
abbr -a gp git pull origin
abbr -a grc git rebase --continue
abbr -a gpo git push origin
abbr -a gd git diff
abbr -a gds git diff --staged
abbr -a gl git log
abbr -a gs git status
abbr -a ga git commit --amend

abbr -a "g[" git [
abbr -a "g]" git ]

# Autocomplete the tags and branches as commands. The git function lets you do
# that and having completion for it is pretty cool.
complete -f -c git -a '(__fish_git_branches)' --description 'Branch'
complete -f -c git -a '(__fish_git_tags)' --description 'Tag'

alias timewalk "git log -p --"
alias wip "git add . and; git commit -mWIP"

alias vim "vim -u NONE"

# XCLIP
alias clipin="xclip -i -selection clipboard"
alias clipout="xclip -o -selection clipboard"

# SSH
alias vpn="sshuttle --dns -D -x 77.246.208.12 -r njichev@77.246.208.12 0/0"

# Browser
alias chrome="google-chrome-stable"
