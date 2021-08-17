local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

print("Loading plugins")

local startup = require("packer").startup

startup(
  function(use, use_rocks)
    use {"wbthomason/packer.nvim", opt = true}
    use "tjdevries/nlua.nvim"
    use "norcalli/nvim.lua"
    -- Colorschemes
    use "quanganhdo/grb256"
    use "morhetz/gruvbox"
    use "edkolev/tmuxline.vim"

    use "andymass/vim-matchup"

    use "bkad/CamelCaseMotion"


    use "scrooloose/nerdtree"

    use "janko-m/vim-test"
    use "kassio/neoterm"

    -- Auto pairs
    use "jiangmiao/auto-pairs"

    -- Elixir
    use "elixir-editors/vim-elixir"

    -- Tpope utility plugins
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    use "tpope/vim-fugitive"
    use "tpope/vim-sleuth"
    use "tpope/vim-endwise"

    -- Other utility plugins
    use "christoomey/vim-tmux-navigator"
    use "terryma/vim-multiple-cursors"
    use "tomtom/tcomment_vim"

    -- Alignment
    use "godlygeek/tabular"

    -- Vim fast searching and moving around
    use "dyng/ctrlsf.vim"

    use {
      "junegunn/fzf",
      run = function()
        vim.fn["fzf#install"]()
      end
    }
    use "junegunn/fzf.vim"

    -- Vim stuff
    use "Shougo/vimproc.vim"
    use "AndrewRadev/switch.vim"
    use "AndrewRadev/splitjoin.vim"

    use "tweekmonster/startuptime.vim"

    -- Text objects
    use "kana/vim-textobj-user"

    -- Syntax for many languages
    use "sheerun/vim-polyglot"
    -- use_rocks {"underscore"}
  end
)

-- require("packer.luarocks").setup_paths()
--
-- _ = require("underscore")
