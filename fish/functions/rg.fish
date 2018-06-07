function rg
  if isatty stdout
    command rg --smart-case --heading --pretty $argv | tr -d "\017" | less -R
  else
    command rg $argv
  end
end
