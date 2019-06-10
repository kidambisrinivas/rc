" VIMRC Configuration File

" Set the text wrap property
set wrap
set encoding=UTF-8

""""""""""""""""""""""""""""""""
" INDENT: BEGIN
""""""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set smarttab
set laststatus=2
set cursorline
set complete-=i
autocmd FileType perl set autoindent|set smartindent
autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

filetype plugin indent on
""""""""""""""""""""""""""""""""
" INDENT: END
""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" VIM_SETTINGS: BEGIN
""""""""""""""""""""""""""""""""
set nonu                                                " Line number visibility
set incsearch
set ignorecase
set smartcase
set ruler
set smarttab
set fileformats=unix,dos,mac                            " support all three, in this order
set formatoptions=tcqor                                 " t=text, c=comments, q=format with                       " gq " , o,r=autoinsert comment leader
set cindent                                             " indent on cinwords
set showmatch                                           " Show matching brackets/braces/parantheses.
set showcmd                                             " Show (partial) command in status line.
set autowrite                                           " Automatically save before commands like :next and :make
set textwidth=98                                        " My terminal is 98 characters wide
set visualbell                                          " Silence the bell, use a flash instead
set cinoptions=:.5s,>1s,p0,t0,(0,g2                     " :.5s = indent case statements 1/2 shiftwidth
set cinwords=if,else,while,do,for,switch,case,class,try " Which keywords should indent
set mat=5
filetype plugin on
filetype indent on
set nocompatible
set backspace=indent,eol,start
""""""""""""""""""""""""""""""""
" VIM_SETTINGS: BEGIN
""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" PLUGINS: BEGIN
" VIM_IDE: https://dev.to/allanmacgregor/vim-is-the-perfect-ide-e80
""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Utility
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'       " Tabular shortcuts: http://vimcasts.org/transcripts/29/en/
Plug 'junegunn/vim-github-dashboard' " github dashboard
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'benmills/vimux'
Plug 'easymotion/vim-easymotion'

" Git Support
Plug 'kablamo/vim-git-log'
Plug 'tpope/vim-fugitive'

" General programming support
Plug 'universal-ctags/ctags'
Plug 'Townk/vim-autoclose'
Plug 'tomtom/tcomment_vim'
Plug 'janko/vim-test' " Set test strategy to vimux

" Mardown / Writing
Plug 'reedes/vim-pencil'

"Plugin 'majutsushi/tagbar'

" Autocomplete / Snippet completion plugins
Plug 'Valloric/YouCompleteMe' " simple, super minimal, super light-weight tab-completion plugin for Vim: https://news.ycombinator.com/item?id=13962505
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Languages
Plug 'fatih/vim-go'

" Theme
Plug 'rakr/vim-one', { 'dir': '~/.vim/pack/vendor/start/vim-one' }

call plug#end()
""""""""""""""""""""""""""""""""
" PLUGINS: END
""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" COLOR_SYNTAX_HIGHLIGHT: BEGIN
""""""""""""""""""""""""""""""""

syntax on
set t_Co=256 
colorscheme one
let g:airline_theme='dracula'
"let g:one_allow_italics = 1
if (has("termguicolors"))
	set termguicolors
endif
set background=dark
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme='dracula'

""""""""""""""""""""""""""""""""
" COLOR_SYNTAX_HIGHLIGHT: END
""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" PLUGINS_SETTINGS: BEGIN
""""""""""""""""""""""""""""""""

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'

" Devicons configuration 
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" Colors
let g:challenger_deep_termcolors = 256
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" Vim-pencil Configuration
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Vim-UtilSnips Configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

" Vim-Test Configuration
let test#strategy = "vimux"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Go configs: Begin
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:ycm_collect_identifiers_from_tags_files = 0
" Go configs: End

" Python configs: Begin
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
let python_highlight_all=1
" python with virtualenv support
" python << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
" EOF
" let g:ycm_python_binary_path = 'python'
" Python configs: End

""""""""""""""""""""""""""""""""
" PLUGINS_SETTINGS: END
""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" VIM_SHORTCUTS: BEGIN
""""""""""""""""""""""""""""""""
" Map Ctrl-E for esc
imap ,, <ESC>
nmap ,, <ESC>
vmap ,, <ESC>
imap <D-V> ^O"+p=`]
nmap ,t <Esc>:tabnew
vmap ,t <Esc>:tabnew

" Tab shortcuts
map  <C-c> <ESC>:q<CR>
nmap <Leader>s <ESC>:w<CR>
imap <C-d> <ESC>:w<CR>

" Buffer Shortcuts
nmap ls :buffers<ENTER>
nmap sw :buffer 
nmap <C-h> :Buffers<CR>
map  <C-l> :FZF<CR>

nmap nc <ESC>:NextColorScheme<ENTER>
nmap pc <ESC>:PrevColorScheme<ENTER>
nmap rc <ESC>:RandomColorScheme<ENTER>

" Shortcut Keys to toggle line numbers and paste mode
:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>

" Perl Lint checker
function! CompileFile()
    let g:compile_command = "perl -MO=Lint -cw "
    execute "!" . g:compile_command. " " . expand("%:p")
endfunction

nmap cc :call CompileFile()<cr>
nmap gf :Git diff %:p<cr>
nmap gq :Git add %:p<cr>

" make tab in visual mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" PLUGIN_SHORTCUTS

map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

" Omnicomplete Better Nav
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Mapping selecting Mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Shortcuts
nnoremap <Leader>f :Files<CR> 

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" junegunn/vim-easy-align shortcuts
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Vim-Test Mappings
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
" nmap <silent> <leader>s :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>v :TestVisit<CR

" Go Shortcuts
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>gds <Plug>(go-def-split)
au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gdt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ge <Plug>(go-rename)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go let $GOPATH = "/Users/srinivas/projects/gocode"

" Easymotion config
map <Leader> <Plug>(easymotion-prefix)
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>S <Plug>(easymotion-s2)
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""
" VIM_SHORTCUTS: BEGIN
""""""""""""""""""""""""""""""""

set complete-=i
" set wildignore-=doc    " should not break helptags
set wildignore+=.git   " should not break clone
set wildignore+=.git/* " should not break clone
set wildignore+=*/.git/*
au VimLeave * ls 
