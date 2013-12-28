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

" Install pathogen for runtime modification
" execute pathogen#infect()

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
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

" Change the colorscheme
Bundle 'altercation/vim-colors-solarized'
" colorscheme murphy
" colorscheme elflord
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" Map f11 to toggle background
map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

set number
set autoindent
set bs=indent,eol,start         " allow backspacing over everything in insert mode

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

set title
set visualbell
set noerrorbells
set ai
set noai
"set mouse=n

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

" command aliases
command W write
command Q quit

" ctl-h removes trailing whitespace from all lines in the file
:nmap <C-h> :%s/\s\+$//e<cr>

" map ;e :w<CR>:exe ":! ./" . getreg("%") . "" <CR>

map ;e :w<CR>:silent !chmod 755 %<CR>:silent !./% > .tmp.xyz<CR>
     \ :vnew<CR>:r .tmp.xyz<CR>:silent !rm .tmp.xyz<CR>:redraw!<CR>

" Scala tests
map <leader>t :w<cr>:!sbt test<cr>

" tab navigation like Firefox
:nmap <C-n> :wn<cr>
:nmap <C-p> :wN<cr>
:imap <C-n> <ESC>:wn<cr>i
:imap <C-p> <ESC>:wN<cr>i
":nmap <C-t> :tabnew<cr>
":map <C-S-tab> :tabprev<cr>
":map <C-tab> :tabnext<cr>
":imap <C-S-tab> <ESC>:tabprev<cr>i
":imap <C-tab> <ESC>:tabnext<cr>i
":imap <C-t> <ESC>:tabnew<cr>

" take indent for new line from previous line
set autoindent
"dark" or "light", used for highlight colors
set background=dark
" how backspace works at start of line
set backspace=indent,eol,start
" keep backup file after overwriting a file
" set backup
" list of directories for the backup file
" set backupdir=~/tmp
" rule a line under the cursor position
"set cursorline
" encoding used internally
set encoding=utf-8
" use spaces when <Tab> is inserted
set expandtab
" automatically detected character encodings
set fileencodings=utf-8
" width of the column used to indicate folds
set foldcolumn=2
" set to display all folds open
set foldenable
" gvim cursor setting
set gcr=n:blinkon0
" don't unload buffer when it is |abandon|ed
set hidden
" highlight matches with last search pattern
set hlsearch
" number of command-lines that are remembered
set history=500
" ignore case in search patterns set ignorecase
set ignorecase
" highlight match while typing search pattern
set incsearch
" tells when last window has status lines
set laststatus=2
" don't redraw while executing macros
set lazyredraw
" wrap long lines at a blank
set linebreak
" DON'T show <Tab> and <EOL>
set nolist
" recognize modelines at start or end of file
set modeline
" ??
set nocp
" print the line number in front of each line
set number
" show cursor line and column in the status line
set ruler
"  minimum nr. of lines above and below cursor
set scrolloff=2
" round indent to multiple of shiftwidth
set shiftround
" number of spaces to use for (auto)indent step
set shiftwidth=2
set shiftround
set expandtab
set smarttab
" number of spaces that <Tab> uses while editing
set softtabstop=2
" syntax to be loaded for current buffer
syntax on
" number of spaces that <Tab> in file use
set tabstop=2
" maximum width of text that is being inserted
" set textwidth=75
" specifies what to save for :mkview
set viewoptions=folds	" save folding state for views
" long lines wrap and continue on the next line
set wrap

" Shortcut to rapidly toggle `set list` (ie show whitespace)
nmap <leader>l :set list!<CR>

 " Use the same symbols as TextMate for tabstops and EOLs
 set listchars=tab:▸\ ,eol:¬


" I think these are gpm-related.
set mouse-=a
set mousehide

" relies on desert file existing. I keep it in ~/.vim/colors/
" colorscheme moria

" override color scheme to make status line darkblue
highlight StatusLine cterm=none ctermbg=darkgreen
highlight StatusLineNC cterm=none ctermbg=darkgreen
highlight VertSplit cterm=none ctermbg=darkgreen

if version >= 700
  " the following line enables spellchecking by default. I prefer to have it
  " off, then toggle it on with F5 when required
  " setlocal spell spelllang=en_au
  :map <F5> :setlocal spell! spelllang=en_au<cr>
  :imap <F5> <ESC>:setlocal spell! spelllang=en_au<cr>
end

" TagList
:map <F6> :TlistToggle <cr>

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
" Bundle "othree/html5.vim"
" Bundle "kongo2002/fsharp-vim"
Bundle "vim-ruby/vim-ruby"
" Bundle "jgdavey/vim-blockle"
" Bundle "tpope/vim-rails"
" Bundle "jhenahan/idris-vim"
"
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

" show the `best match so far' as search strings are typed:
set incsearch

" Map f5 to toggle search highlighting
map <F5> :set hls!set hls?

" paste without trying to re-indent
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

runtime selecta.vim

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", ":e")<cr>
nnoremap <leader>gf :call SelectaCommand("files", ":e")<cr>
nnoremap <leader>ga :call ProducaFunction('xargs -I {} ag -S --nocolor --nogroup --search-files "{}" .', "EditJump")<cr>
nnoremap <leader>gd :call ProducaFunction('xargs -I {} ag -S --nocolor --nogroup --search-files "{}.*::" .', "EditJump")<cr>


" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff <wouter@blub.net>
"augroup encrypted
"    au!
"
"    " First make sure nothing is written to ~/.viminfo while editing
"    " an encrypted file.
"    autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
"    " We don't want a swap file, as it writes unencrypted data to disk
"    autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
"    " Switch to binary mode to read the encrypted file
"    autocmd BufReadPre,FileReadPre      *.gpg set bin
"    autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
"    autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt 2> /dev/null
"    " Switch to normal mode for editing
"    autocmd BufReadPost,FileReadPost    *.gpg set nobin
"    autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
"    autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
"
"    " Convert all text to encrypted text before writing
"    autocmd BufWritePre,FileWritePre    *.gpg   '[,']!gpg --default-key=DD07A6DC--default-recipient-self -ae 2>/dev/null
"    " Undo the encryption so we are back in the normal text, directly
"    " after the file has been written.
"    autocmd BufWritePost,FileWritePost    *.gpg   u
" augroup END
"
