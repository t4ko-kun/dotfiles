" t4ko's sol colorscheme

highlight clear 
if exists("syntax_on") 
	syntax reset 
endif

set background=dark
let g:colors_name="sol"

" Vim specific colors
hi Cursor       ctermfg=234  ctermbg=231  cterm=NONE        guifg=#1a1a1a  guibg=#ecf0f1 gui=NONE
hi Visual       ctermfg=NONE ctermbg=238  cterm=NONE        guifg=NONE     guibg=#444444 gui=NONE
hi CursorLine   ctermfg=NONE ctermbg=236  cterm=NONE        guifg=NONE     guibg=#2f2f2f gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=236  cterm=NONE        guifg=NONE     guibg=#2f2f2f gui=NONE
hi ColorColumn  ctermfg=NONE ctermbg=236  cterm=NONE        guifg=NONE     guibg=#2f2f2f gui=NONE
hi LineNr       ctermfg=244  ctermbg=236  cterm=NONE        guifg=#838586  guibg=#2f2f2f gui=NONE
hi VertSplit    ctermfg=240  ctermbg=240  cterm=NONE        guifg=#575858  guibg=#575858 gui=NONE
hi MatchParen   ctermfg=1    ctermbg=NONE cterm=underline   guifg=#f0433c  guibg=NONE    gui=underline
hi StatusLine   ctermfg=231  ctermbg=240  cterm=bold        guifg=#ecf0f1  guibg=#575858 gui=bold
hi StatusLineNC ctermfg=231  ctermbg=240  cterm=NONE        guifg=#ecf0f1  guibg=#575858 gui=NONE
hi Pmenu        ctermfg=2    ctermbg=NONE cterm=NONE        guifg=#50ae54  guibg=NONE    gui=NONE
hi PmenuSel     ctermfg=NONE ctermbg=238  cterm=NONE        guifg=NONE     guibg=#444444 gui=NONE
hi Search       term=reverse cterm=bold   ctermfg=15 ctermbg=196 gui=bold  guifg=#f7f3ff guibg=#e14d42
hi IncSearch    term=reverse cterm=bold   ctermfg=16 ctermbg=39 gui=bold   guifg=#000000 guibg=#6c71c4
hi Directory    ctermfg=62   ctermbg=NONE cterm=NONE        guifg=#6c71c4  guibg=NONE    gui=NONE
hi Folded       ctermfg=241  ctermbg=234  cterm=NONE        guifg=#606060  guibg=#1a1a1a gui=NONE
hi TabLine      ctermfg=241  ctermbg=234  cterm=NONE        guifg=#606060  guibg=#1a1a1a gui=NONE
hi TabLineSel   ctermfg=255  ctermbg=234  cterm=NONE        guifg=#eeeeee  guibg=#1a1a1a gui=NONE
hi TabLineFill  ctermfg=NONE ctermbg=234  cterm=NONE        guifg=NONE     guibg=#1a1a1a gui=NONE

" Code specific colors
hi Normal       ctermfg=231  ctermbg=234  cterm=NONE         guifg=#ecf0f1 guibg=#1a1a1a gui=NONE
hi Boolean      ctermfg=62   ctermbg=NONE cterm=NONE         guifg=#6c71c4 guibg=NONE    gui=NONE
hi Character    ctermfg=62   ctermbg=NONE cterm=NONE         guifg=#6c71c4 guibg=NONE    gui=NONE
hi Comment      ctermfg=244  ctermbg=NONE cterm=italic       guifg=#838586 guibg=NONE    gui=NONE
hi Conditional  ctermfg=1    ctermbg=NONE cterm=bold         guifg=#f0433c guibg=NONE    gui=bold
hi Constant     ctermfg=62   ctermbg=NONE cterm=NONE         guifg=#6c71c4 guibg=NONE    gui=NONE
hi Define       ctermfg=1    ctermbg=NONE cterm=NONE         guifg=#f0433c guibg=NONE    gui=NONE
hi DiffAdd      ctermfg=231  ctermbg=64   cterm=bold         guifg=#ecf0f1 guibg=#44800a gui=bold
hi DiffDelete   ctermfg=88   ctermbg=NONE cterm=NONE         guifg=#880505 guibg=NONE    gui=NONE
hi DiffChange   ctermfg=231  ctermbg=23   cterm=NONE         guifg=#ecf0f1 guibg=#1d3251 gui=NONE
hi DiffText     ctermfg=231  ctermbg=40   cterm=bold         guifg=#ecf0f1 guibg=#00df00 gui=bold
hi ErrorMsg     ctermfg=15   ctermbg=1    cterm=NONE         guifg=#ffffff guibg=#f0433c gui=NONE
hi WarningMsg   ctermfg=15   ctermbg=1    cterm=NONE         guifg=#ffffff guibg=#f0433c gui=NONE
hi Float        ctermfg=62   ctermbg=NONE cterm=NONE         guifg=#6c71c4 guibg=NONE    gui=NONE
hi Function     ctermfg=2    ctermbg=NONE cterm=NONE         guifg=#50ae54 guibg=NONE    gui=NONE
hi Identifier   ctermfg=68   ctermbg=NONE cterm=NONE         guifg=#3498db guibg=NONE    gui=NONE
hi Keyword      ctermfg=1    ctermbg=NONE cterm=bold         guifg=#f0433c guibg=NONE    gui=bold
hi Label        ctermfg=220  ctermbg=NONE cterm=NONE         guifg=#f1c40f guibg=NONE    gui=NONE
hi NonText      ctermfg=22   ctermbg=234  cterm=NONE         guifg=#30312a guibg=#1a1a1a gui=NONE
hi Number       ctermfg=62   ctermbg=NONE cterm=NONE         guifg=#6c71c4 guibg=NONE    gui=NONE
hi Operator     ctermfg=1    ctermbg=NONE cterm=bold         guifg=#f0433c guibg=NONE    gui=bold
hi PreProc      ctermfg=170  ctermbg=NONE cterm=NONE         guifg=#d75fd7 guibg=NONE    gui=NONE
hi Special      ctermfg=62   ctermbg=NONE cterm=NONE         guifg=#6c71c4 guibg=NONE    gui=NONE
hi SpecialKey   ctermfg=22   ctermbg=236  cterm=NONE         guifg=#f1530f guibg=#1a1a1a gui=NONE
hi Statement    ctermfg=1    ctermbg=NONE cterm=bold         guifg=#f0433c guibg=NONE    gui=bold
hi StorageClass ctermfg=68   ctermbg=NONE cterm=NONE         guifg=#3498db guibg=NONE    gui=NONE
hi String       ctermfg=1    ctermbg=NONE cterm=NONE         guifg=#f0433c guibg=NONE    gui=NONE
hi Structure    ctermfg=68   ctermbg=NONE cterm=bold         guifg=#3498db guibg=NONE    gui=bold
hi Tag          ctermfg=2    ctermbg=NONE cterm=NONE         guifg=#50ae54 guibg=NONE    gui=NONE
hi Title        ctermfg=231  ctermbg=NONE cterm=bold         guifg=#ecf0f1 guibg=NONE    gui=bold
hi Todo         ctermfg=241  ctermbg=NONE cterm=inverse,bold guifg=#606060 guibg=NONE    gui=inverse,bold,italic
hi Type         ctermfg=2    ctermbg=NONE cterm=NONE         guifg=#50ae54 guibg=NONE    gui=NONE
hi Underlined   ctermfg=NONE ctermbg=NONE cterm=underline    guifg=NONE    guibg=NONE    gui=underline
hi SpellBad     term=reverse ctermfg=1    ctermbg=224        gui=undercurl guisp=Red

hi clear SignColumn
" Signify Rules
hi SignifySignAdd    ctermfg=2  ctermbg=NONE cterm=bold guifg=#50ae54 guibg=NONE gui=NONE
hi SignifySignDelete ctermfg=1 ctermbg=NONE cterm=bold guifg=#f0433c guibg=NONE gui=NONE
hi SignifySignChange ctermfg=220 ctermbg=NONE cterm=bold guifg=#f1c40f guibg=NONE gui=NONE

" GitGutter Rules
hi GitGutterAddDefault    ctermfg=2  ctermbg=NONE cterm=bold guifg=#50ae54 guibg=NONE gui=NONE
hi GitGutterDeleteDefault ctermfg=1 ctermbg=NONE cterm=bold guifg=#f0433c guibg=NONE gui=NONE
hi GitGutterChangeDefault ctermfg=220 ctermbg=NONE cterm=bold guifg=#f1c40f guibg=NONE gui=NONE
