status --is-interactive; and . (jump shell fish | psub)

# set PATH $HOME/.rbenv/bin $PATH
# set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

status --is-interactive; and . (rbenv init - | psub)
set EDITOR nvim



# Source the aliases in ~/.config/fish/aliases.fish.
test -f ~/.config/fish/alias.fish; and source ~/.config/fish/alias.fish
