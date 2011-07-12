" .vimrc
"
" Copied from Smylers's .vimrc
" http://www.stripey.com/vim/
"

" use indents of 2 spaces, and have them copied down lines:

" Change the colorscheme
" colorscheme murphy
colorscheme elflord
syntax on

set shiftwidth=2
set shiftround
set expandtab
set smarttab
set nocompatible
set background=dark
set number
set autoindent
set bs=indent,eol,start         " allow backspacing over everything in insert mode

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" enable filetype detection:
filetype on

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8


" Stolen from some guy named ben :) benoit.cerrina@writeme.com
fun BenIndent()
  let oldLine=line('.')
  normal(gg=G)
  execute ':' . oldLine
endfun
map -- :call BenIndent()<CR>


" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" show the `best match so far' as search strings are typed:
set incsearch

" Makefile sanity
autocmd BufEnter ?akefile* set noet ts=8 sw=8
autocmd BufEnter */debian/rules set noet ts=8 sw=8

" Map f11 to toggle background
set background=dark
map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Map f5 to toggle search highlighting
map <F5> :set hls!set hls?

set pastetoggle=<Tab>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
