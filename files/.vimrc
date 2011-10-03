" Use Vim settings, rather then Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
set nocompatible

"set term=builtin_beos-ansi
":if has("terminfo")
":  set t_Co=8
":  set t_Sf=[3%p1%dm
":  set t_Sb=[4%p1%dm
":else
":  set t_Co=8
":  set t_Sf=[3%dm
":  set t_Sb=[4%dm
":endif

if !has("gui") && has("terminfo")
  set t_Co=16
  set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
  set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
else
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax on
set title
set visualbell
set noerrorbells
set ai
set noai
"set mouse=n

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  "filetype plugin indent on

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

" tab navigation like Firefox
":nmap <C-S-tab> :tabprev<cr>
":nmap <C-tab> :tabnext<cr>
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
set backup
" list of directories for the backup file
set backupdir=~/tmp
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
" show <Tab> and <EOL>
set list
" recognize modelines at start or end of file
set modeline
" ??
set nocp
" print the line number in front of each line
set number
" key code that causes 'paste' to toggle
set pastetoggle=<F10>
" show cursor line and column in the status line
set ruler
"  minimum nr. of lines above and below cursor
set scrolloff=2
" round indent to multiple of shiftwidth
set shiftround
" number of spaces to use for (auto)indent step
set shiftwidth=2
" string to use at the start of wrapped lines
set showbreak=\
" show (partial) command in status line
set showcmd
" briefly jump to matching bracket if insert one
set showmatch
" min. nr. of columns to left andright of cursor
set sidescrolloff=4
" no ignore case when pattern as uppercase set smartcase
set smartcase
" use 'shiftwidth' when inserting <Tab>
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

" paste without trying to re-indent
set pastetoggle=<F6>

" I think these are gpm-related.
set mouse=a
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

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff <wouter@blub.net>
augroup encrypted
    au!

    " First make sure nothing is written to ~/.viminfo while editing
    " an encrypted file.
    autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
    " We don't want a swap file, as it writes unencrypted data to disk
    autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
    " Switch to binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre      *.gpg set bin
    autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
    autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt 2> /dev/null
    " Switch to normal mode for editing
    autocmd BufReadPost,FileReadPost    *.gpg set nobin
    autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

    " Convert all text to encrypted text before writing
    autocmd BufWritePre,FileWritePre    *.gpg   '[,']!gpg --default-key=DD07A6DC--default-recipient-self -ae 2>/dev/null
    " Undo the encryption so we are back in the normal text, directly
    " after the file has been written.
    autocmd BufWritePost,FileWritePost    *.gpg   u
augroup END

" Additional filetypes
autocmd! BufRead,BufNewFile *.thtml	set filetype=php
autocmd! BufRead,BufNewFile *.inf	set filetype=text
autocmd! BufRead,BufNewFile *.ck  set filetype=ck
autocmd! BufRead,BufNewFile *.SQL  set filetype=sql

let g:jpTemplateKey = '<C-t>'
