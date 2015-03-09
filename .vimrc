set nocompatible
set shortmess+=I
filetype off
set laststatus=2

let mapleader=','
let maplocalleader=','

set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/code/rust/src/etc/
call vundle#rc()

set background=dark
let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
let g:solarized_menu = 0

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'TagHighlight'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vimwiki/vimwiki'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Blackrush/vim-gocode'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer'

call vundle#end()

call togglebg#map("<F5>")
syntax enable
filetype plugin indent on
colorscheme solarized
set so=4
set wildmenu
set ruler
set cmdheight=1
set hidden
set number
set virtualedit=all
set nowrap
set noerrorbells
set novisualbell
set tm=500
set showmatch
set backspace=eol,start,indent
set noexpandtab
set sw=4
set softtabstop=0
set tabstop=4
set smarttab
autocmd FileType tex,rust set tw=78
set autoindent
set smartindent
set smartcase
set incsearch
set hlsearch
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set undodir=~/.vim/undo
set undofile

set guioptions-=T
set guioptions-=m
set guioptions-=R
set guioptions-=r
set guifont=Termsyn\ 7

set completeopt=menuone

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows =1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" latex
let g:tex_flavor = "latex"
autocmd FileType tex nnoremap <buffer> <leader>lt :w<CR> :!pdflatex %<CR>

" YCM
let g:ycm_global_ycm_extra_conf = '/home/colin/.ycm_extra_conf.py'

" Rust
autocmd FileType rust set et

" New
"highlight CursorLine guibg=grey
au InsertLeave * set nocursorline
au InsertEnter * set cursorline
set nolazyredraw

set spelllang=en_US

map <C-L> 5zl
map <C-H> 5zh
map <silent> <leader># :set number!<CR>
map <silent> <leader>f :execute "NERDTreeToggle" getcwd()<CR>
map <silent> <leader>n :noh<CR>
map <leader>e :e! ~/vimrc<CR>
map <leader>ss :setlocal spell!<CR>

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" set cwd
au BufEnter * silent! :lcd %:p:h
" vim gist
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

let g:netrw_ftpextracmd = "passive"

au BufRead,BufNewFile *.asm set filetype=nasm

augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Unbind the cursor keys in insert, normal and visual modes.
"for prefix in ['i', 'n', 'v']
"	for key in ['<Up>', '<Down>', '<Left>', '<Right>']
"		exe prefix . "noremap " . key . " <Nop>"
"	endfor
"endfor
let g:ycm_confirm_extra_conf = 0

let g:racer_cmd="/home/colin/code/racer/target/release/racer"
let $RUST_SRC_PATH="/home/colin/code/rust/src/"

