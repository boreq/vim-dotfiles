call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

" Misc
set backup                      " Create backups

" Indent using spaces
set shiftwidth=4
set tabstop=4
set expandtab

" Custom indentation settings for different filetypes
autocmd FileType c setlocal shiftwidth=8 tabstop=8
autocmd FileType cpp setlocal shiftwidth=8 tabstop=8
autocmd FileType go setlocal noexpandtab shiftwidth=8 tabstop=8
autocmd FileType cs setlocal noexpandtab shiftwidth=8 tabstop=8

" Auto indent on new line
set autoindent

" A fix for the plugins (vim-go to be exact, otherwise it doesn't work
" correctly)
filetype plugin indent on

" Custom theme
if has("gui_running")
  colorscheme jellybeans
else
  if $COLORTERM == 'gnome-terminal'
    set t_Co=256 " Supports 256 colors, full theme
    colorscheme jellybeans
  else
    let g:jellybeans_use_lowcolor_black = 0 " Fallback to the low color mode
    colorscheme jellybeans
  endif
endif

" Line numbers, ruler etc
set number
set ruler
set showcmd " Show partially completed commands in the status line
set laststatus=2 " Always show the status line
set colorcolumn=101

" Case insensitive search, incremental search
set ignorecase
set incsearch

" Dont clutter the filesystem
silent !mkdir ~/.vimtmp > /dev/null 2>&1
set backupdir=~/.vimtmp
set directory=~/.vimtmp

" NERDTree
nmap <F7> :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'
nmap <C-l> :CtrlPTag<CR>
let g:ctrlp_custom_ignore = 'node_modules'

" ctags
nmap <F9> :!ctags -R .<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_go_checkers = ['go']

" Neovim terminal
tnoremap <Esc> <C-\><C-n>

" vim-go
let g:go_fmt_command = "goimports"
