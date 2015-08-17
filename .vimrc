" VIMRC Configuration File

" Set the text wrap property
set wrap

" Indentation of source code
set shiftwidth=4
set tabstop=4
set autoindent

" Line Number visibility
set nonu
filetype plugin indent on

" Syntax Highlighting
"set bg=dark
syntax on
set t_Co=256 
colorscheme guicolorscheme
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme xoria256 

" Map Ctrl-E for esc
imap ,, <ESC>
nmap ,, <ESC>
vmap ,, <ESC>
imap <D-V> ^O"+p=`]
nmap ,t <Esc>:tabnew
vmap ,t <Esc>:tabnew
" imap <D-v> <ESC>"+p=`]a
" nnoremap p p=`]

" Tab shortcuts
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-k> :q<CR>

" Buffer Shortcuts
nmap ls :buffers<ENTER>
nmap sw :buffer 

" Perl Lint checker
function! CompileFile()
    let g:compile_command = "perl -MO=Lint -cw "
    execute "!" . g:compile_command. " " . expand("%:p")
endfunction

" Vim useful shortcuts

nmap gx yiw/^\(sub\<Bar>function\)\s\+<C-R>"<CR>"
" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

nmap cc :call CompileFile()<cr>
nmap gf :Git diff %:p<cr>
nmap gq :Git add %:p<cr>

" Tab headings

"--------------------------------------------------
" " Some great keyboard shortcuts
"-------------------------------------------------- 

" incremental search
set incsearch
set ignorecase
set smartcase
autocmd FileType perl set autoindent|set smartindent
" 4 space tabs
autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

" show line numbers
autocmd FileType perl set nonu
autocmd FileType perl set autowrite

" make tab in visual mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" Shortcut Keys to toggle line numbers and paste mode
:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>

" comment/uncomment blocks of code (in vmode)
vmap m :s/^/#/gi<Enter>
vmap u :s/^#//gi<Enter>

" my perl includes pod
let perl_include_pod = 1

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

set ruler
set smarttab
set fileformats=unix,dos,mac " support all three, in this order
set formatoptions=tcqor " t=text, c=comments, q=format with "gq", o,r=autoinsert comment leader
set cindent                             " indent on cinwords
set showmatch                   " Show matching brackets/braces/parantheses.
"set background=dark     " set background to dark
set showcmd                             " Show (partial) command in status line.
set autowrite                   " Automatically save before commands like :next and :make
set textwidth=98                " My terminal is 98 characters wide
set visualbell                          " Silence the bell, use a flash instead
set cinoptions=:.5s,>1s,p0,t0,(0,g2     " :.5s = indent case statements 1/2 shiftwidth
set cinwords=if,else,while,do,for,switch,case,class,try   " Which keywords should indent
set showmatch
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L] "Shows detailed status line with formatting
set laststatus=2 "This Makes the status bar visible
set mat=5
filetype plugin on
filetype indent on
set modeline
set nocompatible
set backspace=indent,eol,start

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Include all plugins first
source ~/.vim/plugins.vim

"""""""""""""""""""""
" Plugin Shortcuts
"""""""""""""""""""""
" NerdTree Toggle
map <F4> :NERDTreeToggle <ENTER>

" Command-T
let g:CommandTMaxHeight=5
map <C-m> :CommandT <CR>

" Command-T
nmap gs :Gstatus <ENTER>

" Perl-Support
nmap cp :cp <ENTER>
nmap cn :cn <ENTER>

set complete-=i

" AutoComplPop
"let g:acp_behaviorSnipmateLength=1

filetype plugin indent on    " required

" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_use_short_source_names = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_grep_default_opts = "-iRHn"
      \ . " --exclude='*.svn*'"
      \ . " --exclude='*.svn*'"
      \ . " --exclude='*.log*'"
      \ . " --exclude='*tmp*'"
      \ . " --exclude-dir='**/tmp'"
      \ . " --exclude-dir='CVS'"
      \ . " --exclude-dir='.svn'"
      \ . " --exclude-dir='.git'"
      \ . " --exclude-dir='node_modules'"
      \ . " --exclude-dir='app/vendor'"
      \ . " --exclude-dir='local'"
nnoremap <leader>f :Unite -start-insert file_rec<cr>
nnoremap <leader>r :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>q :Unite -no-split -buffer-name=buffer -quick-match buffer<cr>
nnoremap <leader>g :Unite -no-split -buffer-name=yank    grep:.<cr>
nnoremap <C-n> :tabnew<CR>:Unite --start-insert file_rec/async<CR>
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
let g:unite_source_grep_default_opts = ''
"" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-t>"
let g:UltiSnipsSnippetDirectories=["vim-snippets/UltiSnips/"]

"Bundle 'vim-scripts/CSApprox'
"Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }
"Bundle "vim-scripts/perl-support.vim"

" Elm configs
au BufWritePost *.elm ElmMakeCurrentFile
au BufWritePost *.elm ElmMakeFile("Main.elm")
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>
set autoread

" Notes
nmap <leader>. :Note 

set wildignore+=doc              " should not break helptags
set wildignore+=.git             " should not break clone
set wildignore+=.git/*             " should not break clone
set wildignore+=*/.git/*

" JSX Beautify
function! FormatJSX()
	" let g:cmd = "NODE_PATH=~/.nvm/versions/node/v0.12.7/lib/node_modules node ~/play/jsxlint.js "
	" let g:cmd2 = "ls "
    " let result = execute "!" . g:cmd2 . " " . expand("%:p") 
	" 1,$d
	" call setline( line("."), ''.result )
    let g:compile_command = "NODE_PATH=~/.nvm/versions/node/v0.12.7/lib/node_modules node ~/play/jsxlint.js "
    let result = system(g:compile_command. " " . expand("%:p"))
	echo result
	" 1,$d
	result = substitute(result, '\n$', '', '')
	call setline( line("."), ''.result )
endfunction

au VimLeave * ls 
" au BufWrite *.jsx :call FormatJSX()
 
