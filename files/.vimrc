" .vimrc
"
" Stolen shamelessly from a number of places
"  -> www.stripey.com/vim/
"  -> www.github.com/nkpart/vim-files

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use vundle to manage vim bundles --------------------------------------------
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on     " required!

Bundle "tpope/vim-sensible"
" -----------------------------------------------------------------------------

let mapleader = ","
let g:mapleader = ","

" This is totally awesome - remap jk to escape in insert mode.  You'll never type jk anyway, so it's great!
inoremap jk <Esc>
" How often do use ';' ... now how often do you use ':' ... that's why this mapping exists :)
noremap ; :
" Fast saving
nmap <leader>w :w!<cr>
" save and run current file
nmap <leader>e :w \| !./%<cr>

let g:solarized_termcolors=256
let base16colorspace=256  " Access colors present
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/base16-vim'
set background=dark
colorscheme base16-default
colorscheme solarized

if !has("gui") && has("terminfo")
  set t_Co=16
  set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
  set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm

  " Change cursor in iTerm on insert
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType tex setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" auto correct
ab teh the

" ctl-h removes trailing white space from all lines in the file
:nmap <C-h> :%s/\s\+$//e<cr>

" map ;e :w<CR>:exe ":! ./" . getreg("%") . "" <CR>

map ;e :w<CR>:silent !chmod 755 %<CR>:silent !./% > .tmp.xyz<CR>
     \ :vnew<CR>:r .tmp.xyz<CR>:silent !rm .tmp.xyz<CR>:redraw!<CR>

" Scala tests
map <leader>t :w<cr>:!sbt test<cr>

" buffer navigation like a BOSS!
:nmap <C-n> :w<cr>:bn<cr>
:nmap <C-p> :w<cr>:bN<cr>
:nmap <C-w> :w<cr>:bd<cr>
:imap <C-n> <ESC>:w<cr>:bn<cr>i
:imap <C-p> <ESC>:w<cr>:bN<cr>i

" Tab navigation like a BOSS!
:nmap <C-t> :tabnew<cr>
:map  <C-S-tab> :tabprev<cr>
:map  <C-tab> :tabnext<cr>
:imap <C-S-tab> <ESC>:tabprev<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:imap <C-t> <ESC>:tabnew<cr>

set autoindent                    " take indent for new line from previous line
set background=dark               " "dark" or "light", used for highlight colors
set backspace=indent,eol,start    " how backspace works at start of line
set cursorline                    " rule a line under the cursor position
set encoding=utf-8                " encoding used internally
set expandtab                     " use spaces when <Tab> is inserted
set fileencodings=utf-8           " automatically detected character encodings
set foldcolumn=2                  " width of the column used to indicate folds
set foldenable                    " set to display all folds open
set gcr=n:blinkon0                " gvim cursor setting
set hidden                        " don't unload buffer when it is |abandon|ed
set hlsearch                      " highlight matches with last search pattern
set history=500                   " number of command-lines that are remembered
set ignorecase                    " ignore case in search patterns set ignorecase
set smartcase                     " if you search with a mix of upper/lower case it becomes case sensitive again
set incsearch                     " highlight match while typing search pattern
set laststatus=2                  " tells when last window has status lines
set lazyredraw                    " don't redraw while executing macros
set linebreak                     " wrap long lines at a blank
set nolist                        " DON'T show <Tab> and <EOL>
set modelines=0                   " prevents security exploits [http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html]
set number                        " print the line number in front of each line
set ruler                         " show cursor line and column in the status line
set scrolloff=2                   " minimum nr. of lines above and below cursor
set shiftround                    " round indent to multiple of shiftwidth
set expandtab
set smarttab
set colorcolumn=100
let &colorcolumn=join(range(101,999),",")
highlight ColorColumn ctermbg=108 guibg=#2c2d27
" set smartindent
set softtabstop=2                 " number of spaces that <Tab> uses while editing
set shiftwidth=2                  " number of spaces to use for (auto)indent step
set tabstop=2                     " number of spaces that <Tab> in file use
set viewoptions=folds	            " save folding state for views
set wrap                          " long lines wrap and continue on the next line
set title
set visualbell
set noerrorbells
set mouse-=a
set mousehide
set bs=indent,eol,start           " allow backspacing over everything in insert mode
set incsearch                     " show the `best match so far' as search strings are typed:
map <leader><space> :noh<cr>      " Easily remove search highlighting
set pastetoggle=<F2>              " paste without trying to re-indent

syntax on                         " syntax to be loaded for current buffer

nmap <leader>l :set list!<CR>     " Shortcut to rapidly toggle `set list` (ie show whitespace)
set listchars=tab:▸\ ,eol:¬       " Use the same symbols as TextMate for tabstops and EOLs


" override colour scheme to make status line dark green
highlight StatusLine cterm=none ctermbg=darkgreen
highlight StatusLineNC cterm=none ctermbg=darkgreen
highlight VertSplit cterm=none ctermbg=darkgreen

if version >= 700
  " the following line enables spell checking by default. I prefer to have it
  " off, then toggle it on with F5 when required
  setlocal spell spelllang=en_au
  :map <F5> :setlocal spell! spelllang=en_au<cr>
  :imap <F5> <ESC>:setlocal spell! spelllang=en_au<cr>
end

:map <F6> :TlistToggle <cr>       " TagList

" Lets get crontab editing working
if $VIM_CRONTAB == 'true'
  set nobackup
  set nowritebackup
endif

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" enable filetype detection:
filetype on

" Autocomplete settings - use ctrl-space to get the shit going :)
set ofu=syntaxcomplete#Complete
inoremap <C-Space> <C-p>
inoremap <C-@> <C-p>

" Languages
Bundle "derekwyatt/vim-scala"
so ~/.dot-files/files/.vim/bundle/vim-scala/ftdetect/scala.vim
Bundle "vim-ruby/vim-ruby"
Bundle "Markdown"

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
autocmd BufEnter ?akefile* set noet ts=8 sw=8
autocmd BufEnter */debian/rules set noet ts=8 sw=8

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" Stolen from some guy named ben :) benoit.cerrina@writeme.com
fun BenIndent()
  let oldLine=line('.')
  normal(gg=G)
  execute ':' . oldLine
endfun
map -- :call BenIndent()<CR>

" Show trailing spaces in bright red - they are the devil!!! (don't ask why)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" function! ResCur()
"   if line("'\"") <= line("$")
"     normal! g`"
"     return 1
"   endif
" endfunction

" augroup resCur
"   autocmd!
"   autocmd BufWinEnter * call ResCur()
" augroup END


" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
runtime selecta.vim
nnoremap <leader>f :call SelectaCommand("find * -type f", ":e")<cr>
nnoremap <leader>gf :call SelectaCommand("files", ":e")<cr>
nnoremap <leader>ga :call ProducaFunction('xargs -I {} ag -S --nocolor --nogroup --search-files "{}" .', "EditJump")<cr>
nnoremap <leader>gd :call ProducaFunction('xargs -I {} ag -S --nocolor --nogroup --search-files "{}.*::" .', "EditJump")<cr>

