alias rg "/usr/bin/rg"



alias mkdir "mkdir -p"
alias untar "tar -xzvf"

abbr -a c cc
abbr -a k make
abbr -a v valgrind

# Shortcuts for rails, grunt, make, docker and git.
abbr -a r rails
abbr -a d docker
abbr -a g git
abbr -a m mix
abbr -a mr mix run --no-halt
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
abbr -a gpo git push origin master
abbr -a gd git diff
abbr -a gl git log
abbr -a gs git status
abbr -a ga git commit --amend

abbr -a "g[" git [
abbr -a "g]" git ]

function git
  switch (count $argv)
    case 0
      command git status
      return $status
    case 1
      set -l target_branch $argv[1]

      # For some reason, the __fish_git_branches and __fish_git_tags functions
      # are not defined during the first run of the git function. Just inline
      # them for now.
      set -l available_branches (command git branch --no-color -a ^/dev/null | grep -v ' -> ' | sed -e 's/^..//' -e 's/^remotes\///')
      set -l available_tags (command git tag ^/dev/null)

      if contains $target_branch $available_branches $available_tags
        command git checkout $target_branch
        return 0
      end
  end
  hub $argv
end

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
