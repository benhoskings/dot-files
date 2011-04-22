set et
set sw=2
set nu
syntax on
set autoindent
set smartindent
set guifont=Inconsolata:h14
set bg=dark
set pastetoggle=<F6>

if has("autocmd")
  filetype indent on
endif

" 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap wq :silent! normal mpeld bhd `ph<CR>

