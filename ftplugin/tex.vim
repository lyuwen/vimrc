set tabstop=2 expandtab shiftwidth=2 softtabstop=2
nnoremap <F9> :execute "!latexmk -g -pdf -pdflatex=\"pdflatex -interactive=nonstopmode\" %"<CR> :execute "!latexmk -c "<CR>
"set modeline
