" use pathogen to load plugins when not using vim8
if v:version < 800
    execute pathogen#infect()
    call pathogen#helptags()
endif

" basic settings
set nocompatible    " turn off vi compat mode
set noshowmatch     " do not show matching brackets by flickering
set noshowmode      " mode will be seen with airline
set ignorecase      " search ignores case
set smartcase       " but not when the pattern has an upper case
set autowrite       " automatically save before :next etc.
set mouse=          "

" spacing settings
set tabstop=4       " visual spaces per <Tab>
set shiftwidth=4    " spaces column is indented when using << >>
set softtabstop=4   " number of spaces in <Tab> when editing
set expandtab       " in insert mode use appropriate number of spaces for a <Tab>

" options for insert mode completion
set completeopt=longest,menuone

" color settings
set t_Co=256            " allow 256 colors in the terminal
set background=dark
colorscheme wombat256mod

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

let g:go_fmt_command = "goimports"

" python-mode
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
