set tabstop=2 expandtab shiftwidth=2 softtabstop=2

function! Build_TeX()
  execute "!latexmk -g -pdf -pdflatex=\"pdflatex -shell-escape -interactive=nonstopmode\" % && latexmk -c"
endfunction
function! Build_TeX_bg()
  execute "!latexmk -g -pdf -pdflatex=\"pdflatex -shell-escape -interactive=nonstopmode\" % 2>/dev/null >/dev/null && latexmk -c 2>/dev/null >/dev/null &"
endfunction
function! Build_and_Preview()
  silent call Build_TeX() | silent execute "!open ".expand("%:r").".pdf" | redraw!
endfunction
"nnoremap <F9> :call Build_TeX()<CR>
nnoremap <S-F9> :call Build_TeX_bg()<CR><CR>
nnoremap <leader>v :call Build_and_Preview()<CR>
"set modeline
"
nnoremap <leader>ce :call Tex_ChangeEnvironments()<CR>

if has("touchbar")
	inoremenu icon=NSTouchBarAddDetailTemplate TouchBar.Env <C-r>=Tex_FastEnvironmentInsert("no")<cr>
	nnoremenu icon=NSTouchBarAddDetailTemplate TouchBar.Env i<C-r>=Tex_FastEnvironmentInsert("no")<cr>
	vnoremenu icon=NSTouchBarAddDetailTemplate TouchBar.Env <C-\><C-N>:call Tex_FastEnvironmentInsert("yes")<CR>
	" tmenu TouchBar.Env Env
endif
