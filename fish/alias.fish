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
abbr -a gd git diff
abbr -a gl git log
abbr -a gs git status
abbr -a ga git commit --amend

abbr -a g[ git [
abbr -a g] git ]

# Use hub for git with a twist -- if the first argument is an existing branch
# then switch to it.
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

function vim
  command vim -p $argv 2>/dev/null
end

# Autocomplete the tags and branches as commands. The git function lets you do
# that and having completion for it is pretty cool.
complete -f -c git -a '(__fish_git_branches)' --description 'Branch'
complete -f -c git -a '(__fish_git_tags)' --description 'Tag'
