alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias ...... "cd ../../../../.."

# alias pacman -S "sudo pacman -S"

alias mkdir "mkdir -p"

# Let there be colors in cat!
alias cat ccat

# Shortcuts for rails, grunt, make, docker and git.
abbr -a r rails
abbr -a m make
abbr -a d docker
abbr -a g git

# Bundler abbrs
abbr -a b bundle
abbr -a be bundle exec
abbr -a bi bundle install

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

# Git subcommands shortcuts.
abbr -a gc git commit
abbr -a gco git checkout
abbr -a gcp git cherry-pick
abbr -a gpo git push origin master
abbr -a gd git diff
abbr -a gl git log
abbr -a gs git status
abbr -a ga git commit --amend


function vim
  command vim -p $argv 2>/dev/null
end
