status --is-interactive; and . (jump shell fish | psub)

rbenv rehash >/dev/null ^&1

status --is-interactive; and . (rbenv init - | psub)
set -x EDITOR nvim
set -x DISABLE_AUTO_TITLE true
# Source the aliases in ~/.config/fish/aliases.fish.
test -f ~/.config/fish/alias.fish; and source ~/.config/fish/alias.fish
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
