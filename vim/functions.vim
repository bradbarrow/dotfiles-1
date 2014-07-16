" async test running

function! SetTestFileToCurrentFile()
  let g:CurrentTestFile = @%
endfunction

function! GetCurrentTestFile()
  return g:CurrentTestFile
endfunction

function! GetTestRunner()
  return "rspec -f d"
endfunction

function! GetCurrentTestCommand()
  return "" . GetTestRunner() . " " . GetCurrentTestFile()
endfunction

function! SendCurrentTestToPipe()
  let pipeName = ".test-commands"
  call system("echo " . GetCurrentTestCommand() .  " > " . pipeName)
endfunction

function! ModalRunCurrentTest()
  exec "!" . GetCurrentTestCommand()
endfunction
