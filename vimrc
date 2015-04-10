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
""Plugin 'lervag/vim-latex'
"" END Plugin list

call vundle#end()
filetype plugin indent on
"" END Vundle
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
if has('gui_running')
    colorscheme solarized
    let g:airline_powerline_fonts=1
else
    colorscheme bclear
endif


set encoding=utf-8
set showcmd                         " display incomplete commands

"" Tab specific option, hämtat från http://www.haskell.org/haskellwiki/Vim
set tabstop=8   	" En tabb = 8 mellanslag
set shiftwidth=4	" Indrag = 4 mellanslag
set expandtab           " Mellanslag > Tabbar
set softtabstop=4       " Slå in 4 mellansl. när tab är intryckt
set smarttab		" Indrag ist. för tab i början av en rad
set shiftround		" Avrunda mellanslag till närmsta shiftwidth multipel
set nojoinspaces	" ALDRIG ALDRIG TABBAR


set backspace=indent,eol,start      " backspace through everything in insert mode
set nolist

"Abbreviations
:iabbrev @@     me@olofsjodin.se
:iabbrev ccopy  Copyright 2015 Olof Sjödin, all rights reserved.
:iabbrev ppython #!/usr/bin/env python3 <cr>#-*- coding: utf-8 -*-
:iabbrev rruby  #!/usr/bin/env ruby <cr># encoding: utf-8

"" Searching
set hlsearch                        " highlight matches
set incsearch                       " incremental searching
set ignorecase                      " searches are case insensitive...
set smartcase                       " ... unless they contain at least one capital letter

"" Mappings
nmap <F8> :TagbarToggle<CR>         " mapping f8 to TagbarToggle
nmap <F2> :NERDTreeToggle<CR>       " mapping f2 to NERDTreeToggle
noremap <F5> :GundoToggle<CR>       " mapping f5 to Gundo
noremap <F9> :Gcommit<CR>           " mapping f9 to Gcommit
noremap! jj <Esc>                   "<Esc> to jj

"" Mapping 
let mapleader = ","                 " setting leader to , 

set laststatus=2                    " Always show the statusline

" Enable fancy mode 
" let g:Powerline_symbols = 'fancy'   " Powerline

"SWAGG
set number                           " setting line numbers
""set colorcolumn=81                           " line to show 81 character mark
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
""set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?
""set langmap=åq,äw,öe,pr,yt,fy,gu,ci,ro,lp,aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?
