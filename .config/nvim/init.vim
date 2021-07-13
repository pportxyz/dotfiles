" vim:set ft=vim et sw=2:

" === Plugins ===========================================

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

"Plug 'lervag/vimtex'
Plug 'itchyny/lightline.vim'                            " Cool and lightweight bar
"Plug 'Yggdroot/indentLine'                              " Self-descriptive
Plug 'tpope/vim-fugitive'                               " Git integration
Plug 'psliwka/vim-smoothie'                             " Smooth scroll
Plug 'junegunn/fzf'                                     " Fuzzy search
Plug 'junegunn/fzf.vim'                                 " More fuzzyness
Plug 'tpope/vim-surround'                               " Manage surrounding characters
Plug 'kaicataldo/material.vim', { 'branch': 'main' }    " Material colorscheme
Plug 'sirver/ultisnips'                                 " Snippets for repetitive tasks
Plug 'tpope/vim-obsession'                              " Sessions file (works great with tmux)


Plug 'neoclide/coc.nvim', {'branch': 'release'}         " Need to learn and refactor this plugin
" Coc Plugins -> :CocInstall coc-json coc-sh coc-yaml coc-cfn-lint coc-texlab coc-git coc-snippets
"
" Testing
Plug 'dense-analysis/ale'

" Always load the last one
Plug 'ryanoasis/vim-devicons'                           " Fancy icons with other plugin integration.

call plug#end()


" === Settings & colors =================================

" Disable arrow keys to practise hjkl. To navigate throught history, use C-n and C-p
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" colorscheme & syntax
syntax on
syntax enable
set termguicolors
let g:material_theme_style = 'darker'
let g:material_terminal_italics = 1
colorscheme material

" general config
set hidden                                              " allow to hide a file to open another buffer
set noshowmode                                          " using lightline to display mode
set number                                              " Line numbers
set autoindent                                          " Auto-indent new lines.
set expandtab                                           " Use spaces instead of tabs.
set smarttab                                            " Set smart tabbing
set tabstop=8 softtabstop=0 shiftwidth=4
set hlsearch                                            " Highlight all search results.
set ignorecase                                          " Needed for the next.
set smartcase                                           " Enable smart-case search.
set incsearch                                           " Searches for strings increasingly.
set foldmethod=indent                                   " Self-explicative
set splitright                                          " Self-explicative
set splitbelow                                          " Self-explicative
set relativenumber                                      " Self-explicative
set scrolloff=2                                         "Scroll when 2 lines from top/bottom
set textwidth=100

" Exit INSERT with jj
imap jj <ESC>

" Easy split mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Aliases
cnoreab diffsaved w !git diff --color=always % -

" Allow saving of files as sudo when vim started without privileges.
cmap w!! w !sudo tee > /dev/null %

" See tabs and EOLs
set list
set listchars=eol:·,tab:▸\ 

" 2-space indent in YAML files and carriage return
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab

" Open terminal
function! OpenTerminal()
  split term://zsh
  resize 4
endfunction
nnoremap <c-x> :call OpenTerminal()<CR>


" === FZF config ===================================
let g:fzf_preview_window = ['up:80%:hidden', 'ctrl-/']
command! -bang NubiiFiles call fzf#vim#files('~/Nextcloud/SF/NUBII', <bang>0)
nnoremap <C-f> :Files<CR>
nnoremap <C-n> :NubiiFiles<CR>
nnoremap <C-b> :Buffers<CR>


" === NERDTree config ===================================
let g:NERDTreeGitStatusUseNerdFonts = 1


" === Lightline config ===================================
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified', '%{FugitiveStatusline()}' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'FugitiveHead'
  \ },
  \ }

