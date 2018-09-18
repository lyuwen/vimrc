set tabstop=2 expandtab shiftwidth=2 softtabstop=2

function! Build_TeX()
  execute "!latexmk -g -pdf -pdflatex=\"pdflatex -interactive=nonstopmode\" % && latexmk -c"
endfunction
function! Build_TeX_bg()
  execute "!latexmk -g -pdf -pdflatex=\"pdflatex -interactive=nonstopmode\" % 2>/dev/null >/dev/null && latexmk -c 2>/dev/null >/dev/null &"
endfunction
function! Build_and_Preview()
  silent call Build_TeX() | silent execute "!open ".expand("%:r").".pdf" | redraw!
endfunction
"nnoremap <F9> :call Build_TeX()<CR>
nnoremap <S-F9> :call Build_TeX_bg()<CR><CR>
nnoremap <leader>v :call Build_and_Preview()<CR>
"set modeline
