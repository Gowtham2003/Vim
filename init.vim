set noic

call plug#begin()
Plug 'mlaursen/vim-react-snippets'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'mengelbrecht/lightline-bufferline'
Plug 'cocopon/iceberg.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

"------------------------------------------------------------------------------
"                             Basic Settings
"------------------------------------------------------------------------------
set termguicolors
syntax on
set mouse=a
filetype plugin on
colorscheme purify
set cursorline              " Highlight current line
set laststatus=2            " Always show status line
set number                  " Enable line numbers.
set numberwidth=5           " width of numbers line (default on gvim is 4)
set showmatch               " show matching parenthesis
set splitbelow splitright   " how to split new windows.
set encoding=UTF-8
set noshowmode
"------------------------------------------------------------------------------
"                             Key Mappings
"------------------------------------------------------------------------------
nnoremap <C-s> :w <CR>
inoremap <C-s> <Esc> :w <CR> i
nnoremap <C-q> :q! <CR>
nnoremap <C-f> :FZF<CR>
inoremap <C-x> <Esc>
"------------------------------------------------------------------------------
"                             NERDTree Settings
"------------------------------------------------------------------------------
autocmd vimenter * NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close vim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"------------------------------------------------------------------------------
"                             Light Line Config
"------------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'purify',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

"------------------------------------------------------------------------------
"                           Coc Config
"------------------------------------------------------------------------------
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
"------------------------------------------------------------------------------
"                             Coc-Snippets Setiings
"------------------------------------------------------------------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"------------------------------------------------------------------------------
"                            Setiings to Open Terminal 
"------------------------------------------------------------------------------
"" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

augroup nodeterm 
	autocmd!
	autocmd BufWinEnter,WinEnter term://* nnoremap <buffer> <C-c> i<C-c>
	autocmd BufWinEnter,WinEnter *.py,*.js,*.jsx,*.html,*.css nnoremap <buffer> <C-c> i<C-c>
augroup END
"------------------------------------------------------------------------------
"                            Light Line buffer Tabs Config
"------------------------------------------------------------------------------
set showtabline=2
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)


nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

"------------------------------------------------------------------------------
"                            FZF Configs 
"------------------------------------------------------------------------------
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"------------------------------------------------------------------------------
"                            Clearing All Highlight 
"------------------------------------------------------------------------------

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"------------------------------------------------------------------------------
