"""""""""""""""""""""""""""""""""
" .vimrc - Config file for vim  "
"                               "
" 2015-06-19                    "
" by Olof <medik> Sjödin        "
"  
"                               "
" Licensed with GPL v3.0        "
"                               "
"""""""""""""""""""""""""""""""""


"" START Vundle
set nocompatible                    " choose no compatibility with legacy vi
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"" START Plugin list
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'klen/python-mode'
""Plugin 'lervag/vim-latex'
"" END Plugin list

call vundle#end()
filetype plugin indent on
"" END Vundle


"" Colorscheme 
syntax enable
if has('gui_running')
    colorscheme solarized
    let g:airline_powerline_fonts=1
else
    colorscheme desert
endif


set encoding=utf-8
set showcmd             " display incomplete commands

"" Tab specific option, inspired from http://www.haskell.org/haskellwiki/Vim
" PEP 8: https://www.python.org/dev/peps/pep-0008/
set textwidth=79
set tabstop=8   	" sets one tab to 8 spaces
set expandtab           " will use spaces instead of tab
set shiftwidth=4	" sets indent to 4 spaces
set softtabstop=4       " 
set smarttab		" sets tab to the value of shiftwidth in beginning of a line
set shiftround		" will align indent to the closest multiple of shiftwidth
set autoindent          " align the new line indent with the previous line
set nojoinspaces	" don't add spaces when joining lines


set backspace=indent,eol,start      " backspace through everything in insert mode 
set nolist

"" Searching
set hlsearch                        " highlight matches
set incsearch                       " incremental searching
set ignorecase                      " searches are case insensitive...
set smartcase                       " ... unless they contain at least one capital letter

"" Mappings
let mapleader = ","                 " setting leader to , 

nmap <F2> :NERDTreeToggle<CR>       " mapping f2 to NERDTreeToggle
nmap <F8> :TagbarToggle<CR>         " mapping f8 to TagbarToggle
"noremap! jj <Esc>                   "<Esc> to jj

set laststatus=2                    " Always show the statusline

set number                                   " setting line numbers
set colorcolumn=81                         " line to show 81 character mark
set cursorline                               " shows the horizontal cursor line
nmap <leader>ev :vsplit $MYVIMRC<cr>         " mapping to edit my vimrc quickly
nmap <leader>sv :source $MYVIMRC<cr>         " mapping to source my vimrc quickly

"Badass Functions
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
"for c in range(char2nr('A'), char2nr('Z'))
"  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
"  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
"endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=250
"set ts=2 sw=2 et
"let g:indent_guides_start_level = 2
"

set guifont=Source\ Code\ Pro\ for\ Powerline\ 10

" pymode

let g:pymode_python = 'python3'
