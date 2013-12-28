function! SelectaCommand(choice_command, vim_command)
  try
    silent! exec a:vim_command . " " . system(a:choice_command . " | selecta")
  catch /Vim:Interrupt/
  endtry
  redraw!
endfunction

function! SelectaFunction(choice_command, vim_function)
  try
    let choice = system(a:choice_command . " | selecta")
    let Fn = function(a:vim_function)
    call Fn(choice)
    " silent! exec a:vim_command . " " . 
  catch /Vim:Interrupt/
  endtry
  redraw!
endfunction

function! BijectaFunction(choice_command, regex, vim_function)
  try
    let cmd = a:choice_command . ' | bijecta "' . a:regex . '" selecta'
    echo cmd
    let choice = system(cmd)
    let Fn = function(a:vim_function)
    call Fn(choice)
    " silent! exec a:vim_command . " " . 
  catch /Vim:Interrupt/
  endtry
  redraw!
endfunction

function! SelectaCommand2(input, vim_command)
  try
    silent! exec a:vim_command . " " . system("selecta", join(a:input, "\n"))
  catch /Vim:Interrupt/
  endtry
  redraw!
endfunction

function! ProducaCommand(choice_command, vim_command)
  try
    silent! exec a:vim_command . " " . system("produca " . a:choice_command)
  catch /Vim:Interrupt/
  endtry
  redraw!
endfunction

function! ProducaFunction(choice_command, vim_function)
  try
    let choice = system("produca " . a:choice_command)
    let Fn = function(a:vim_function)
    call Fn(choice)
  catch /Vim:Interrupt/
  endtry
  redraw!
endfunction
