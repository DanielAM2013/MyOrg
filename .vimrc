set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'DanielAM2013/MyVim'
Bundle 'mateusbraga/vim-spell-pt-br'

call vundle#end()            " required
filetype plugin indent on    " required
set spell spelllang=pt,en
syntax on

"set foldmethod=indent
set foldmethod=syntax
set foldlevelstart=1

set foldcolumn=4
let g:syntastic_auto_jump=1
hi Folded ctermbg=0
hi FoldColumn ctermbg=0 ctermfg=Green
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
set foldlevelstart=20
let g:syntastic_javascript_checkers = ['jshint']
" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
hi MatchParen cterm=none ctermbg=none ctermfg=blue
hi clear SpellBad
hi SpellBad cterm=underline
vmap <C-C> "+y
set mouse=v
if filereadable(expand('cscope.out'))
	cs add cscope.out
	set cscopetag
	set csto=0
endif
