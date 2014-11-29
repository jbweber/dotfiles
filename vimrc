syntax on
set nocompatible
set nohlsearch
set ai
set noshowmatch
set ignorecase
set smartcase

set list
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent
set expandtab
set listchars=tab:>-,trail:.
set t_Co=256
color fu
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd BufRead,BufNewFile *.py highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead,BufNewFile *.py match BadWhitespcace /^\t\+/
autocmd BufRead,BufNewFile *.py match BadWhitespcace /^\s\+%/
autocmd BufRead,BufNewFile *.wsgi set filetype=python
autocmd BufRead,BufNewFile *.sh,*.wsdl,*.xsd,*.xml,*.yml,*.yaml set tabstop=2
autocmd BufRead,BufNewFile *.sh,*.wsdl,*.xsd,*.xml,*.yml,*.yaml set shiftwidth=2
autocmd BufRead,BufNewFile *.sh,*.wsdl,*.xsd,*.xml,*.yml,*.yaml set softtabstop=2
autocmd BufRead,BufNewFile bashrc,.bashrc,bash_profile,.bash_profile set syn=sh
