syntax on

set number					" Line numbers

set autoindent					" Auto-indent new lines.
set expandtab					" Use spaces instead of tabs.
set smarttab                    		" Set smart tabbing
set tabstop=8 softtabstop=0 shiftwidth=4 

set hlsearch					" Highlight all search results.
set smartcase					" Enable smart-case search.
set incsearch					" Searches for strings increasingly.

set ruler			" Show row and column information.

" Vim-Plug
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'

call plug#end()
