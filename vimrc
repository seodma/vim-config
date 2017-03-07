filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins repos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'IndexedSearch'
Plugin 'blueyed/vim-diminactive'
Plugin 'FooSoft/vim-argwrap'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
" syntax
Plugin 'pangloss/vim-javascript'
Plugin 'slim-template/vim-slim'
Plugin 'smancill/conky-syntax.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
" finishing setup vundle
call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General behaviour
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" vundle required
filetype off
" Indent settings
" ---------------
set tabstop=2
set shiftwidth=2
" Default to 2 spaces as tabs
set softtabstop=2
" replace tabs by spaces
set expandtab
" Enable syntax coloring only for short lines
set synmaxcol=200
" reload buffer when external changes detected
set autoread
" allow backspace in insert mode
set backspace=2
" Backup and swap settings
" ------------------------
set backup
set backupdir=~/tmp,/tmp " store backups
set dir=~/tmp,/tmp       " files in RAM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins settings and plugins mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let g:NERDTreeWinPos            = 'left' "by default
let g:NERDTreeDirArrows         = 0
let g:NERDTreeWinSize           = 40
let g:NERDTreeChristmasTree     = 1
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeQuitOnOpen        = 0
let g:NERDTreeShowBookmarks     = 1
" vim-airline

let g:airline#extensions#branch#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep          = ''
let g:airline_right_sep         = ''
let g:airline_symbols.linenr    = '¶'
let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.paste     = '⇲'
let g:airline_symbols.space     = ' '
let g:airline_symbols.maxlinenr = ''

nnoremap <Leader><Leader>g :Ack <cword><cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands and mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Key mappings
nmap              <F1>    :NERDTreeToggle<cr>
vmap              <F1>  <esc>:NERDTreeToggle<cr>i
imap              <F1>  <esc>:NERDTreeToggle<cr>i
" show line numbers
set number
set numberwidth=3
  " open nerdtree when vim starts
au vimenter * if !argc() && &filetype != 'man' | NERDTree | endif
" Easy window navigation
noremap <space>h <C-w>h
noremap <space>j <C-w>j
noremap <space>k <C-w>k
noremap <space>l <C-w>l
" resize window CTRL+(h|j|k|l)
noremap <C-j> :resize +1<CR>
noremap <C-k> :resize -1<CR>
noremap <C-h> :vertical resize -1<CR>
noremap <C-l> :vertical resize +1<CR>
" Surround
" remap surround key mappings
" t+s(ingle) quotes, t+d(ouble) quotes
nmap ts csw'El
nmap td csw"El
nmap <leader>- yss-
nmap <leader>= yss=
" When shifting, retain selection over multiple shifts
vmap <expr> > KeepVisualSelection(">")
vmap <expr> < KeepVisualSelection("<")
" Enable filetype detection
filetype plugin on
filetype plugin indent on
"
" Autocommands
"
augroup general
  " remove all existing autocmds
  autocmd!

  " reload .vimrc after saving
  au BufWritePost $MYVIMRC source $MYVIMRC

  " Save if focus lost
  au BufLeave,FocusLost * silent! wall

  au BufRead,BufNewFile *.coffee set ft=coffee syntax=coffee
  au BufRead,BufNewFile *.scss set ft=scss syntax=scss
  au BufRead,BufNewFile /etc/nginx/* set ft=nginx
  au BufRead,BufNewFile *.json set ft=json
  au BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn set ft=markdown

  " Make .sh files executable on write
  au BufWritePost *.sh silent !chmod a+x %

  " Restore cursor position
  au BufReadPost *   if line("'\"") > 1 && line("'\"") <= line("$") |
                   \   exe "normal! g`\"" |
                   \ endif

  " hide cursorline when focus is on other window
  au VimEnter,WinEnter,BufwinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline

  " open nerdtree when vim starts
  au vimenter * if !argc() && &filetype != 'man' | NERDTree | endif

  " open csv files in read-only by default
  au vimenter *.csv set ro

augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface setings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

" more colors
set t_Co=256

" colors and theme overrides
set cursorline
let g:gruvbox_italic=0
let g:gruvbox_underline=0
set background=dark
colorscheme gruvbox

hi Boolean   ctermfg=73
hi Constant  ctermfg=73
hi CursorLineNr ctermfg=223 ctermbg=237
hi Directory ctermfg=107
hi Function  ctermfg=173 cterm=none
hi Type  ctermfg=179
hi Typedef  ctermfg=179
hi LineNr    ctermfg=243 ctermbg=237
hi Normal                ctermbg=black
hi Number    ctermfg=73
hi String    ctermfg=107

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" always show statusline
set laststatus=2
" set indentation as previous line
set autoindent
" Turn on autoindenting of blocks
set smartindent
" Show name of buffer in terminal title
set title
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vars
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let javascript_fold = 0
let mapleader       = ","
let g:mapleader     = ","
" disable matchparens
let loaded_matchparen = 1
" disable underline, bold, italic styling for html files
let html_no_rendering = 1

function! KeepVisualSelection(cmd)
  set nosmartindent
  if mode() ==# "V"
    return a:cmd . ":set smartindent\<CR>gv"
  else
    return a:cmd . ":set smartindent\<CR>"
  endif
endfunction
