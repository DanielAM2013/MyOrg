set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'vim/vim'
"Plugin 'powerline/powerline'
"Plugin 'kien/ctrlp.vim'
"Plugin 'benmills/vimux'
"Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rust-lang/rust.vim'
"Plugin 'L9'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'azadkuh/vim-cmus'
Plugin	'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'ap/vim-templates'
"Plugin 'vim-scripts/sudoku'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'vim-scripts/restore_view.vim'
"Plugin 'mattn/webapi-vim'
"Plugin '7kfpun/finance.vim'
"Plugin 'severin-lemaignan/vim-minimap'
"Plugin 'koron/minimap-vim'
"Plugin 'Raimondi/delimitMate'
Plugin 'DanielAM2013/MyAlg'
Plugin 'DanielAM2013/MyVim'
Plugin 'DanielAM2013/MyOrg'
Plugin 'DanielAM2013/MyTemp'
Plugin 'DanielAM2013/Scripts'
Bundle 'mateusbraga/vim-spell-pt-br'

call vundle#end()            " required
"filetype plugin indent on    " required
filetype plugin indent on    " required
set spell spelllang=pt,en
syntax on

"set foldmethod=indent
set foldmethod=syntax
set foldlevelstart=1

"set foldnestmax=3
set foldcolumn=4
let g:syntastic_auto_jump=1
"hi Folded guibg=#AA0000
hi Folded ctermbg=0
hi FoldColumn ctermbg=0 ctermfg=Green
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
"autocmd VimEnter * SyntasticToggleMode " disable syntastic by default"
"set nospell
set foldlevelstart=20
let g:syntastic_javascript_checkers = ['jshint']
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
hi MatchParen cterm=none ctermbg=none ctermfg=blue
hi clear SpellBad
hi SpellBad cterm=underline
let g:airline_theme='angr'
