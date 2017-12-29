" load plugins
execute pathogen#infect()
call pathogen#helptags()

set t_Co=256
set background=dark
colorscheme fu

set nocompatible    " turn off vi compat mode
set nohlsearch      " do not highlight search matches
set autoindent      " copy indent from current line when starting new line
set noshowmatch     " do not show matching brackets by flickering
set noshowmode      " mode will be seen with airline
set ignorecase      " search ignores case
set smartcase       " but not when the pattern has an upper case

set tabstop=4       " visual spaces per tab
set shiftwidth=4    " spaces column is indented when using << >>
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set autowrite       " automatically save before :next etc.
set autoread        " automatically reread changed files

set completeopt+=menuone
set completeopt-=preview

" vim-airline
let g:airline_theme='wombat'

" vim-go
au FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab    " use actual tabs in Go
au FileType go setlocal listchars+=tab:\ \ ,
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

" python-mode
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
