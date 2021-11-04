" vim:foldmethod=marker:foldlevel=0
" t4ko's vimrc

call plug#begin()		" specify installed plugins
	" Programming
	Plug 'neovim/nvim-lspconfig'
	" Plug 'nvim-lua/completion-nvim'
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'jiangmiao/auto-pairs'
	Plug 'ap/vim-css-color'

	" Completion framework
	Plug 'hrsh7th/nvim-cmp'

	" LSP completion source for nvim-cmp
	Plug 'hrsh7th/cmp-nvim-lsp'

	" Snippet completion source for nvim-cmp
	Plug 'hrsh7th/cmp-vsnip'

	" Other usefull completion sources
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-buffer'

	" See hrsh7th's other plugins for more completion sources!

	" To enable more of the features of rust-analyzer, such as inlay hints and more!
	Plug 'simrat39/rust-tools.nvim'

	" Snippet engine
	Plug 'hrsh7th/vim-vsnip'

	" Fuzzy finder
	" Optional
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	" Version Control
	Plug 'jreybert/vimagit'
	Plug 'mhinz/vim-signify'
	" Usability
	Plug 'liuchengxu/vim-which-key'
	Plug 'ap/vim-buftabline'
	" Productivity
	Plug 'ahmedkhalf/project.nvim'
	Plug 'vimwiki/vimwiki'
call plug#end()

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-q>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

lua << EOF
  require("project_nvim").setup {
	  -- Manual mode doesn't automatically change your root directory, so you have
	  -- the option to manually do so using `:ProjectRoot` command.
	  manual_mode = false,

	  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
	  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
	  -- order matters: if one is not detected, the other is used as fallback. You
	  -- can also delete or rearangne the detection methods.
	  detection_methods = { "lsp", "pattern" },

	  -- All the patterns used to detect root dir, when **"pattern"** is in
	  -- detection_methods
	  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

	  -- Table of lsp clients to ignore by name
	  -- eg: { "efm", ... }
	  ignore_lsp = {},

	  -- Don't calculate root dir on specific directories
	  -- Ex: { "~/.cargo/*", ... }
	  exclude_dirs = {},

	  -- Show hidden files in telescope
	  show_hidden = false,

	  -- When set to false, you will get a message when project.nvim changes your
	  -- directory.
	  silent_chdir = true,

	  -- Path where project.nvim will store the project history for use in
	  -- telescope
	  datapath = vim.fn.stdpath("data"),
  }
  require('telescope').load_extension('projects')
EOF

runtime freebsd.vim		" source freebsd style(9) configurations

runtime which-key.vim

set path=$PWD/** 		" when opening a file search all subdirectories
syntax enable			" enable syntax processing
filetype plugin indent on		" load filetype-specific indent files
set encoding=utf-8
colorscheme sol

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

" use touch type friendly motion
noremap ; l
noremap l k
noremap k j
noremap j h

" stay in visual mode when indenting blockwise
vnoremap > >gv
vnoremap < <gv

set number relativenumber

set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>


set showcmd				" print command in navigation row
set cursorline
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
