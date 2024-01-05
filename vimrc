"Helps force plugins to load correctly when it is turned back on below
filetype off

" Put all swap files in .swap
set backupdir=~/vimfiles/backup/,~/vimfiles/temp/
set directory=~/vimfiles/swap/

" Load plugins here (pathogen or vundle)
"execute pathogen#infect()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Sounds
set visualbell
set t_vb=
set noerrorbells

" Switch between vim tabs 
map <C-left> :tabprevious<CR>
map <C-right> :tabnext<CR>
inoremap <C-left> <ESC>:tabprevious<CR>
inoremap <C-right> <ESC>:tabnext<CR>

" Move vim tabs 
"map <C-Space> :tabm+1<CR>
"map <C-Space-right> :tabm-1<CR>
"inoremap <C-S-left> <ESC>:tabm+1<CR>
"inoremap <C-right> <ESC>:tabm-1<CR>

" Save shortcut
nnoremap <F1> <ESC>:w<CR>

" Remap Visual Block Mode
nnoremap <F2> <C-V>

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
 
" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
"set matchpairs+=<:> " use % to jump between pairs
"runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

 " " Allow hidden buffers
  set hidden
 "
 " " Rendering
  set ttyfast
 "
 " " Status bar
  set laststatus=2
 "
 " " Last line
  set showmode
  set showcmd
 "
 " " Searching
  set incsearch
  set ignorecase
  set smartcase
  set showmatch
  map <leader><space> :let @/=''<cr> " clear search
 "
 " " Tags
  set tags=tags
  map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
 "

" " Textmate holdouts
"
" " Formatting
map <leader>q gqip
"
" Custom Mapping
map <S-Enter> o<ESC> 

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL


