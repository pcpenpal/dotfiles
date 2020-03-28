call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/syntastic'
Plug 'timonv/vim-cargo'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:deoplete#enable_at_startup = 1

"let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='/usr/src/rust/src'

let g:airline_powerline_fonts = 1

set ts=8 sts=4 sw=4 et
set nu
set bg=dark
