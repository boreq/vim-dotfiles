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
set colorcolumn=81

" Case insensitive search, incremental search
set ignorecase
set incsearch

" Dont clutter the filesystem
silent !mkdir ~/.vimtmp > /dev/null 2>&1
set backupdir=~/.vimtmp
set directory=~/.vimtmp

" Autoload plugins using pathogen
execute pathogen#infect()

" NERDTree
nmap <F7> :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'
nmap <C-l> :CtrlPTag<CR>
let g:ctrlp_custom_ignore = 'node_modules'

" Tagbar
nmap <F8> :TagbarOpenAutoClose<CR>

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
