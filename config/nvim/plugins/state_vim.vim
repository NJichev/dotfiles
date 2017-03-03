if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/njichev/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/njichev/dotfiles/config/nvim/plugins'
let g:dein#_runtime_path = '/home/njichev/dotfiles/config/nvim/plugins/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/njichev/dotfiles/config/nvim/plugins/.cache/.vimrc'
let &runtimepath = '/home/njichev/.vim,/home/njichev/dotfiles/config/nvim/plugins/repos/github.com/Shougo/dein.vim,/home/njichev/dotfiles/config/nvim/plugins/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/home/njichev/dotfiles/config/nvim/plugins/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/home/njichev/.vim/after'
