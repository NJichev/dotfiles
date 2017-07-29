status --is-interactive; and . (jump shell fish | psub)

rbenv rehash >/dev/null ^&1

status --is-interactive; and . (rbenv init - | psub)

set -gx PATH ~/.npm-global/bin $PATH
set -gx PATH ~/.cargo/bin/ $PATH
set -x EDITOR nvim
set -x DISABLE_AUTO_TITLE true
# Source the aliases in ~/.config/fish/aliases.fish.
test -f ~/.config/fish/alias.fish; and source ~/.config/fish/alias.fish
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# tiny-care-terminal
set -gx TTC_SAY_BOX parrot
set -gx TTC_REPOS ~/Work/,~/private-projects,~/ruby-projects,~/elixir-projects
set -gx TTC_REPOS_DEPTH 2
set -gx TTC_GITBOT git log
set -gx TTC_WEATHER Sofia
