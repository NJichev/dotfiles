if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/njichev/dotfiles/config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/njichev/dotfiles/config/nvim/plugins'
let g:dein#_runtime_path = '/home/njichev/dotfiles/config/nvim/plugins/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/njichev/dotfiles/config/nvim/plugins/.cache/init.vim'
let &runtimepath = '/home/njichev/.config/nvim,/etc/xdg/nvim,/home/njichev/.local/share/nvim/site,/usr/local/share/nvim/site,/home/njichev/dotfiles/config/nvim/plugins/repos/github.com/Shougo/vimproc.vim,/home/njichev/dotfiles/config/nvim/plugins/repos/github.com/Shougo/dein.vim,/home/njichev/dotfiles/config/nvim/plugins/.cache/init.vim/.dein,/usr/share/nvim/site,/usr/share/nvim/runtime,/home/njichev/dotfiles/config/nvim/plugins/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/njichev/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/njichev/.config/nvim/after'
filetype off
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['deoplete.nvim'])
