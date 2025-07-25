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

" Vim-LSP
let g:lsp_use_native_client = 1
if executable('typescript-language-server')
  " pnpm install -g typescript-language-server typescript
  au User lsp_setup call lsp#register_server({
	\ 'name': 'typescript-language-server',
	\ 'cmd': {server_info->['typescript-language-server', '--stdio']},
	\ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
	\ 'allowlist': ['typescript', 'javascript', 'typescriptreact', 'javascriptreact'],
	\ })
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=no
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  " Tab completion
  inoremap <buffer> <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"
  inoremap <buffer> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

  let g:lsp_format_sync_timeout = 1000
  nmap <buffer> <leader>f <plug>(lsp-document-format-sync)

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
