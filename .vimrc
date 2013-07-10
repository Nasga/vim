" vim:fdm=marker

" Editor {{{
set nocompatible                "Non compatiblity with vi
set encoding=utf-8              "Default encoding
set number                      "Line number
set ttyfast                     "More move while redraw
set lazyredraw                  "No redraw while doing macro
set hidden                      "Buffer are hide when abandoned
set visualbell                  "No sound
set title                       "Change term title
set autoread                    "Reload files changed outside vim
set noswapfile
set clipboard=unnamed           "Use alt to paste in osx
set backspace=indent,eol,start  "Delete w/ insert
let &titleold=getcwd()          "Reset term title when exit vim
set wildmenu                    "Autocomplete filenames
set wildmode=longest,list       "Sort longest filename
set cursorline                  "Hl the line of the cursor
autocmd BufEnter * silent! lcd %:p:h
" 80 chars limit
if exists("&colorcolumn")
  set colorcolumn=80
endif
" }}}
" Mouse {{{
set mouse=
" nnoremap <silent> <C-MouseDown> <C-W>-
" nnoremap <silent> <C-MouseUp> <C-W>+i
" }}}
" Statusline {{{
set statusline=[%n]\ %<         "Buffer Number
set statusline+=%<%w%f\ %=%y[%{&ff}] "FileName
set statusline+=[%6c]           "Filetype
set statusline+=[%{printf('%'.strlen(line('$')).'s',line('.'))}/%L]
set statusline+=[%3p%%]
set statusline+=%{'['.(&readonly?'RO':'\ \ ').']'}
set statusline+=%{'['.(&modified?'+':'-').']'}
set laststatus=2                "Always show status bar
" }}}
" Search {{{
set hlsearch                    "Hihlight matches
set incsearch                   "Incremental searching
set ignorecase                  "Searches are case insisensitive
set smartcase                   " ... unless they contain one capital letter

" Center screen on occurence
nnoremap n nzz
nnoremap N Nzz
" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>
" }}}
" Tabs & Indent {{{
set autoindent
set expandtab                   "Convert tab -> spacei
set tabstop=2                   "A tab = 2 spaces
set shiftwidth=2
set softtabstop=2
set copyindent
set smarttab
" display indentation guides
set lcs=tab:\|\ ,trail:-,precedes:<,extends:>

" Indent with tabs
vmap <Tab> >gv
vmap <S-Tab> <gv
" Keep selection after indent
vnoremap < <gv
vnoremap > >gv
" }}}
" Files {{{ 
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.vue.php set ft=html
filetype on
filetype plugin on
" }}}
" Windows {{{
" Smart moving between windows r
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" }}}
" Diff {{{
if &diff
  set diffopt+=iwhite
endif
" }}}
" Hard mode {{{
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}
" Binds {{{
iabbrev </ </<C-x><C-o>
inoremap jk <Esc>
inoremap {<CR>  {<CR>}<Esc>O<Tab>
let mapleader = "-"
" }}}

" Plugin:Pathogen {{{
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()
" }}}
" Plugin:Syntastic {{{
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" }}}
" Plugin:IndentLine {{{
let g:indentLine_minimumIndentLevel = 0
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239
" }}}
" Plugin:Php-cs-fixer {{{
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"
let g:php_cs_fixer_level = "all"
let g:php_cs_fixer_config = "default"
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

autocmd BufWritePre *.php %s/\s\+$//ge
autocmd BufWritePre *.php %s/if ( /if (/ge
autocmd BufWritePre *.php %s/if(/if (/ge
autocmd BufWritePre *.php %s/foreach(/foreach (/ge
" %s/\s*,\s*/, /g
" }}}
" Plugin:matchit {{{
runtime macros/matchit.vim      " Enable jump betwen tags
" }}}
" Plugin:ctrlp {{{
let g:ctrlp_user_command = 'ag --nogroup --nobreak --noheading --nocolor -g "" %s '
" }}}

" Colors {{{
set background=dark
syntax on
let &t_Co=256
color badwolf
" }}}
