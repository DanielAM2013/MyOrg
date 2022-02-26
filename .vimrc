set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'DanielAM2013/MyVim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'morhetz/gruvbox'
Bundle 'mateusbraga/vim-spell-pt-br'

call vundle#end()            " required
filetype plugin indent on    " required
set spell spelllang=pt,en
syntax on

"set foldmethod=indent
set foldmethod=syntax
set foldlevelstart=1
set foldlevelstart=20
set foldcolumn=4
hi Folded ctermbg=0
hi FoldColumn ctermbg=0 ctermfg=Green

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_auto_jump=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_cpp_include_dirs=['include']

hi MatchParen cterm=none ctermbg=none ctermfg=blue

hi clear SpellBad
hi SpellBad cterm=underline

vmap <C-C> "+y
set mouse=a

if filereadable(expand('cscope.out'))
	cs add cscope.out
	set cscopetag
	set csto=0
endif

let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:syntastic_cpp_include_dirs = [ 'include']
"let b:syntastic_cpp_cflags = ' -Iinclude -lspdlog -lfmt'
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_enable_signs=1

"let g:enable_ycm_at_startup = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0

filetype on
colorscheme gruvbox
set bg=dark
let g:termdebug_wide=1
