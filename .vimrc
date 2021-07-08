" THIS IS TAKEN FROM THE EXAMPLE CONFIG FILE

" Use Vim settings, rather than Vi settings (much better!).
set nocompatible

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" CUSTOM CHANGES BELOW THIS LINE

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
"Plug 'tomtom/tlib_vim.git'
"Plug 'MarcWeber/vim-addon-mw-utils.git'
"Plug 'garbas/vim-snipmate.git'
"Plug 'honza/vim-snippets.git'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
"Plug 'lervag/vimtex'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'posva/vim-vue'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Misc
set backup                      " Create backups
set history=50                  " Remember last 50 commands
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode

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

" Vimtex
nmap <F6> :VimtexTocToggle<CR>

" Neovim terminal
tnoremap <Esc> <C-\><C-n>

" vim-go
let g:go_fmt_command = "goimports"

" vim-vue
autocmd FileType vue syntax sync fromstart

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <tab> auto-select the first completion item and notify coc.nvim to
" format on enter, <tab> could be remapped by other vim plugin
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
