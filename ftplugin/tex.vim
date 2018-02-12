set tabstop=2 expandtab shiftwidth=2 softtabstop=2

function! Build_TeX()
  execute "!latexmk -g -pdf -pdflatex=\"pdflatex -interactive=nonstopmode\" % && latexmk -c"
endfunction
function! Build_and_Preview()
  call build_tex()
  execute "!open ".expand("%:r").".pdf"
endfunction
nnoremap <F9> :call Build_TeX()<CR>
nnoremap <leader>v :call Build_and_Preview()<CR>
"set modeline
