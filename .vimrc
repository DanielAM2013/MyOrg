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
"Plugin 'L9'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'azadkuh/vim-cmus'
Plugin	'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
"Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'ap/vim-templates'
"Plugin 'vim-scripts/sudoku'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'vim-scripts/restore_view.vim'
"Plugin 'mattn/webapi-vim'
"Plugin '7kfpun/finance.vim'
"Plugin 'severin-lemaignan/vim-minimap'
"Plugin 'koron/minimap-vim'
Plugin	'DanielAM2013/MyVim'
Plugin 'DanielAM2013/MyOrg'
"Plugin 'DanielAM2013/MyTemp'
Plugin 'DanielAM2013/Scripts'

Plugin 'DanielAM2013/MyTemp'

call vundle#end()            " required
filetype plugin indent on    " required
set spell spelllang=pt,en
syntax on

set foldmethod=syntax
"set foldnestmax=2
set foldcolumn=4
let g:syntastic_auto_jump=1
"hi Folded guibg=#AA0000
hi Folded ctermbg=0
hi FoldColumn ctermbg=0 ctermfg=Green
