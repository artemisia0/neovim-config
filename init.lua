-- ~/.config/nvim/init.lua

--[[  
				Firstly install vim-plug

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

				then open neovim and execute 'PlugInstall'
				and restart neovim and be happy.
--]]

vim.cmd("\
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')\
\
Plug 'tpope/vim-sensible'\
Plug 'junegunn/seoul256.vim'\
Plug 'jiangmiao/auto-pairs'\
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}\
Plug 'windwp/nvim-ts-autotag'\
\
call plug#end()\
")

require('nvim-ts-autotag').setup()

require'nvim-treesitter.configs'.setup {
	indent = {
		enable = true
	}
}

vim.cmd('colo seoul256')
vim.cmd('hi normal ctermbg=16')
vim.cmd('hi error ctermbg=none')

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

AutoPairsFlyMode = true

