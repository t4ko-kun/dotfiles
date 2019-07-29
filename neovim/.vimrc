" vim:foldmethod=marker:foldlevel=0
" Manuel Breiden's vimrc

syntax enable			" enable syntax processing
colorscheme default

set tabstop=4			" number of visual spaces per TAB
"set softtabstop=4		" number of spaces in TAB when editing
set expandtab			" tabs are substituted by spaces 
set shiftwidth=4
"set smarttab

set relativenumber
set showcmd				" print command in navigation row
"set cursorline
filetype indent on		" load filetype-specific indent files

" Folding {{{
set foldenable			" enable folding
set foldmethod=syntax	" fold based on indent level
set foldlevelstart=10	" open n folds by default
set foldnestmax=10	" maximum fold depth of n
" }}}
