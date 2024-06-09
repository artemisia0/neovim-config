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

vim.cmd('colo seoul256')
vim.cmd('hi normal ctermbg=16')
vim.cmd('hi error ctermbg=none')

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

AutoPairsFlyMode = true

require('nvim-ts-autotag').setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false
	},

	update_events = { 'InsertLeave', 'TextChanged', 'CursorMoved', 'InsertEnter', 'BufEnter', 'BufRead' },
    cursor_offset = 0,
	update_tag_on_change = true,
})

-- Setup autocommands to trigger autotag and indent on Enter
vim.cmd[[
augroup AutoTagAndIndent
    autocmd!
    autocmd FileType html,typescriptreact,javascriptreact inoremap <buffer> <CR> <CR><C-o>==<C-o>O
augroup END
]]

require'nvim-treesitter.configs'.setup {
	indent = {
		enable = true
	},
	highlight = {
		enable = true
	},
}

