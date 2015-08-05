"""""""""""
" VUNDLE
"""""""""""

set nocompatible               " be iMproved
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'
Plugin 'Shougo/neomru.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'vim-perl/vim-perl'
"Plugin 'vim-scripts/perl-support.vim'
Plugin 'vim-scripts/tComment'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'majutsushi/tagbar'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'scrooloose/syntastic'

Plugin 'lambdatoast/elm.vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
