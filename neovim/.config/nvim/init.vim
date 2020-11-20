" vim:foldmethod=marker:foldlevel=0
" t4ko's vimrc

let mapleader=" "

call plug#begin()		" specify installed plugins
Plug 'mhinz/vim-signify'
Plug 'jreybert/vimagit'
call plug#end()

runtime freebsd.vim		" source freebsd style(9) configurations

set path=$PWD/** 		" when opening a file search all subdirectories
syntax enable			" enable syntax processing
filetype indent on		" load filetype-specific indent files
set encoding=utf-8
colorscheme default

set wildmode=longest,list,full " enable autocompletion in command mode

set tabstop=4			" width of a tab character
"set softtabstop=4		" width of character string which is inserted when hitting the tab key
"set expandtab			" tab characters are substituted by spaces
"set smarttab			" :help smarttab for further information
set shiftwidth=4		" width of indentation when using > and < keys

" List configuration
set listchars=tab:→\ ,trail:·,eol:$ " highlight tabs and trailing spaces
noremap <F3> :set list! list? <CR>
inoremap <F3> <C-o>:set list! list?<CR>
cnoremap <F3> <C-c>:set list! list?<CR>

noremap <F4> :nohl <CR>

vnoremap > >gv
vnoremap < <gv

set number relativenumber

set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set showcmd				" print command in navigation row
"set cursorline
"set cursorcolumn

" Folding {{{
set foldenable			" enable folding
set foldmethod=syntax	" fold based on indent level
set foldlevelstart=10	" open n folds by default
set foldnestmax=10		" maximum fold depth of n
" }}}

" Statusline {{{
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' '.l:branchname.'':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %n\ 
set statusline+=%#Normal#
set statusline+=\ \ %f
set statusline+=%m\ 
if GitBranch() != ""
	set statusline+=%#PmenuSel#
	set statusline+=\ %{StatuslineGit()}\ 
	set statusline+=%#Normal#
endif
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ 
set statusline+=\ \ %l:%c\ (%p%%)
set statusline+=\ 
" }}}
