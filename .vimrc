"http://statico.github.io/vim.html
"http://www.cs.swarthmore.edu/help/vim
"see also
"http://vim.wikia.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally
"https://github.com/amix/vimrc
execute pathogen#infect()
syntax on
filetype plugin indent on

" if $TERM == "xterm-256color" || $TERM == "screen-256color"
"   set t_Co=256
"   colorscheme zenburn
" endif

set background=dark
set guifont=Source\ Code\ Pro:h16
colorscheme monokai

" more natural (to me) cmdline navigation
:cnoremap <C-A> <Home>
:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>

" I've read this is nice
set nocompatible

" Allow hiding modified buffers (plays nice with Ctrl-P plugin)
set hidden

if has("gui_macvim")
  set guioptions=gmrLe
  " This mapping makes Ctrl-Tab switch between tabs.
  " Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>
endif

" Map shift-tab in vim to inverse tab in Vim
" for command mode
nmap <S-Tab> <<
" for insert mode
imap <S-Tab> <Esc><<i

" ctrlp plugin
let g:ctrlp_reuse_window = 1
set wildignore+=node_modules/**,coverage/**,bdd/vendor/**,bdd/page_dumps/**
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$\|coverage$\|node_modules$\|bower_components$\|vendor$\|page_dumps$\|quality$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" Highlight tabs and trailing spaces
set listchars=tab:>\ ,trail:·,extends:>,precedes:<,nbsp:+
set list

"highlight column 80
set cc=80

" toggle line numbers
nmap <leader>l :setlocal number!<CR>
set nu

" Gently highlight the current line
set cursorline

set spl=en_gb spell

"toggle paste mode
nmap <leader>o :set paste!<CR>

"tab modes
nmap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap <leader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" toggle wrap
nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

"everybody's buffering...
nmap <C-b> :CtrlPBuffer<CR>
nmap <F9> :CtrlPMRU<CR>
let g:ctrlp_reuse_window = 1
nmap <C-e> :e#<CR>
nmap <leader>n :bnext<CR>
nmap <leader>p :bprev<CR>

"nerd
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>@ :NERDTreeFind<CR>

"quicker comments
nmap ,/ gcc
vmap ,/ gc
imap ,/ <Esc>gcci

" tabs
nmap ,T :tabnew<CR>
nmap ,{ :tabprev<CR>
nmap ,} :tabnext<CR>
"ctrl-p
let g:ctrlp_reuse_window = 1
set wildignore+=node_modules/**,coverage/**,bdd/vendor/**,bdd/page_dumps/**
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$\|coverage$\|node_modules$\|bower_components$\|vendor$\|page_dumps$',
    \ 'file': '',
    \ 'link': '',
    \}

"Sublime PhpStorm keymap
nmap <C-c> :TComment<CR>
nmap <C-d> yyp

" * Enable vim-airline tabline
let g:airline#extensions#tabline#enabled = 1

" Always display the status line, even if only one window is displayed
set laststatus=2

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=a

" Smart searches
set ignorecase
set smartcase

" Natural splits
set splitbelow
set splitright


" File types
au BufRead,BufNewFile *.md set filetype=markdown

" macOS copy to clipboard
vmap '' :w !pbcopy<CR><CR>
