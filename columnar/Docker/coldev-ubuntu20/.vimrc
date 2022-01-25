set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set number
set hlsearch
syntax on
colors elflord
set tags=tags;
nmap <F8> :TagbarToggle<CR>
set modeline
set matchpairs+=<:>

call plug#begin()
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
call plug#end()

autocmd FileType c,cpp autocmd BufWritePre <buffer> %s/\s\+$//e
