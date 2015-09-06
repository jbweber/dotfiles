execute pathogen#infect()

syntax on

set t_Co=256
set background=dark

colorscheme Sunburst

set nocompatible
set nohlsearch
set ai
set noshowmatch
set ignorecase
set smartcase

set list

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab

filetype plugin indent on

map <F2> :NERDTreeToggle<CR>

" vim-go
au FileType go set listchars=tab:\¦\ ,trail:-,extends:>,precedes:<,nbsp:+
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

