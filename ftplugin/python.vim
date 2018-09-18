set tabstop=2 expandtab shiftwidth=2 softtabstop=2
"if has("nvim")
"  nnoremap <F9> :call NvimRun() <CR>
"else
"  nnoremap <F9> :execute "!python %"<CR>
"endif
function! NvimRun()
  call neoterm#do("python %")
  call neoterm#open()
endfunction
"set modeline
"
"
"vmap ,r :w !/home/lf2507/scripts/runPyScriptFromStdin.py<CR>

function! RunPyBlock() range
  python << EOF
import vim
import warnings
warnings.filterwarnings("ignore")
lines=vim.eval("getline(a:firstline, a:lastline)")
emptyspace=len(lines[0])-len(lines[0].lstrip())
for line in lines:
  tmp=line.strip()
  if len(tmp)>0:
    exec(line[emptyspace:])
EOF
  echo "[Done]"
  "echo system('python -c "'.join(getline(a:firstline, a:lastline), "\x0a").'"')
endfunction
command! -range RunPyBlock :<line1>,<line2>call RunPyBlock()
vmap ,r :RunPyBlock<CR>

let g:ipy_perform_mappings = 0
let g:ipy_autostart = 0
vmap  <buffer> <silent> <F9>           :python run_these_lines()<CR><CR>
map  <buffer> <silent> <C-S-F9>        :IPythonNew<CR>
