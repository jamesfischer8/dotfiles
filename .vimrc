set shiftwidth=2 smarttab
set number                  " Show line numbers

" Enable syntax highlighting
syntax enable

" Enable file-type detection, plugin loading, and indenting
filetype plugin indent on

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

set incsearch               " Search as characters are entered
set hlsearch                " Highlight search matches
set ignorecase              " Case insensitive searching
set smartcase               " Case sensitive if uppercase used

set mouse=a                 " Enable mouse support
set clipboard=unnamedplus   " Use system clipboard
set backspace=indent,eol,start  " Make backspace work properly
set scrolloff=8             " Keep 8 lines visible above/below cursor

" Clear search highlighting with Escape
nnoremap <Esc> :noh<CR>

" Trying to fix ts highlighting freeze
" set synmaxcol=200
" set redrawtime=10000
" syntax sync fromstart
" syntax sync maxlines=100
set re=2