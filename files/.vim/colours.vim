syntax enable
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized
set background=dark

if !has("gui") && has("terminfo")
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

