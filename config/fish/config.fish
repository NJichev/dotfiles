eval (direnv hook fish)
status --is-interactive; and source (jump shell fish | psub)

set -x EDITOR nvim

set -x DISABLE_AUTO_TITLE true
# Source the aliases in ~/.config/fish/aliases.fish.
test -f ~/.config/fish/alias.fish; and source ~/.config/fish/alias.fish
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

set -x ERL_AFLAGS "-kernel shell_history enabled"

source ~/.asdf/asdf.fish
set fish_greeting ""

function term
  set config_file ~/.config/alacritty/alacritty.yml
  sed -i"" "s/\(^colors: \*\).*/\1$argv/g" $config_file
end

setenv SSH_ENV $HOME/.ssh/environment

function start_agent
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV 
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ] 
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/njichev/Work/inflowmatix/inflownet-webapp-lambdas/node_modules/tabtab/.completions/serverless.fish ]; and . /home/njichev/Work/inflowmatix/inflownet-webapp-lambdas/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/njichev/Work/inflowmatix/inflownet-webapp-lambdas/node_modules/tabtab/.completions/sls.fish ]; and . /home/njichev/Work/inflowmatix/inflownet-webapp-lambdas/node_modules/tabtab/.completions/sls.fish
