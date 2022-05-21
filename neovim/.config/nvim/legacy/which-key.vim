" vim:foldmethod=marker:foldlevel=0
" Define Space as leader key and start WhichKey Plugin when it's pressed
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_vertical = 0

" Define and register prefix dictionary
let g:which_key_map =  {}
call which_key#register('<Space>', "g:which_key_map")

" b:Buffer {{{
let g:which_key_map.b = { 'name' : '+Buffer' }

nnoremap <silent> <leader>b1 :b1<CR>
let g:which_key_map.b.1 = 'buffer 1'
nnoremap <silent> <leader>b2 :b2<CR>
let g:which_key_map.b.2 = 'buffer 2'
nnoremap <silent> <leader>b3 :b3<CR>
let g:which_key_map.b.3 = 'buffer 3'
nnoremap <silent> <leader>b4 :b4<CR>
let g:which_key_map.b.4 = 'buffer 4'
nnoremap <silent> <leader>b5 :b5<CR>
let g:which_key_map.b.5 = 'buffer 5'
nnoremap <silent> <leader>b6 :b6<CR>
let g:which_key_map.b.6 = 'buffer 6'
nnoremap <silent> <leader>b7 :b7<CR>
let g:which_key_map.b.7 = 'buffer 7'
nnoremap <silent> <leader>b8 :b8<CR>
let g:which_key_map.b.8 = 'buffer 8'
nnoremap <silent> <leader>b9 :b9<CR>
let g:which_key_map.b.9 = 'buffer 9'

nnoremap <silent> <leader>bd :bd<CR>
let g:which_key_map.b.d = 'delete buffer'
nnoremap <silent> <leader>bR :u0<CR>
let g:which_key_map.b.R = 'revert buffer'

nnoremap <silent> <leader>bn :bn<CR>
let g:which_key_map.b.n = 'next buffer'
nnoremap <silent> <leader>bp :bp<CR>
let g:which_key_map.b.p = 'previous buffer'
" }}}

" f:Files {{{
let g:which_key_map.f = { 'name' : '+File' }

nnoremap <silent> <leader>fs :update<CR>
let g:which_key_map.f.s = 'save file'

nnoremap <silent> <leader>fv :e $MYVIMRC<CR>
let g:which_key_map.f.v = 'open vimrc'

nnoremap <silent> <leader>fr :e $MYVIMRC<CR>
let g:which_key_map.f.r = 'reload vimrc'
" }}}
