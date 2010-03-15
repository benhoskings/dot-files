function du
  if test (uname -s) = "Darwin"
    du -k -d 1 $argv;
  else
    du -k --max-depth=1 $argv;
  end
end
