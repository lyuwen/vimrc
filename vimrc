let mapleader='\'
set wildmenu
set nocompatible
set incsearch
set updatetime=250
filetype off
set nohlsearch
" Dynamically get the location of the vimrc file and assume that directory as
" the base directory of all vim configurations.
let g:vimrcdir=substitute(system('dirname '.shellescape($MYVIMRC)), '\n\+$', '', '')

exe "set rtp+=".g:vimrcdir

if empty(g:vimrcdir)
  let g:vimrcdir=$HOME.'/.vim'
endif

" get private information
if !empty(glob(g:vimrcdir."/private.vim"))
  source ~/.vim/private.vim
endif

"VimPlug
call plug#begin(g:vimrcdir.'/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'majutsushi/tagbar'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-latex/vim-latex'
  Plug 'rickhowe/diffchar.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-surround'
  Plug 'rhysd/vim-grammarous'
  Plug 'rlue/vim-barbaric'
  Plug 'lyuwen/vim-ipython'
  Plug 'scrooloose/nerdcommenter'
  Plug 'junegunn/vader.vim'
  "Plug 'airblade/vim-gitgutter'
  " Plug 'suan/vim-instant-markdown'
  Plug 'tell-k/vim-autopep8'
  Plug 'nvie/vim-flake8'
  Plug 'terryma/vim-multiple-cursors'
if has('nvim')
  Plug 'ervandew/supertab'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'davidhalter/jedi-vim'
  Plug 'zchee/deoplete-jedi'
  Plug 'kassio/neoterm'
else
  Plug 'valloric/youcompleteme'
endif
call plug#end()

"fortran
let fortran_free_source=1
let fortran_do_enddo=1

""In GUI the windows get larger
if has("gui_running")
	set lines=45 columns=180
endif
set backspace=2
"color scheme
syntax on
set background=dark
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let g:solarized_degrade = 1
colorscheme solarized
set nu
set modeline
"indent
set autoindent
set smartindent
set cindent
set pastetoggle=<F4>
"split direction
set splitbelow
set splitright
"Moving between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <leader>j <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <leader>k <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <leader>l <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>h <C-W><C-H>
"indent
set tabstop=2 expandtab shiftwidth=2 softtabstop=2
set expandtab
filetype plugin indent on    " required
set autoread " Set to auto read when a file is changed from the outside
set encoding=utf-8
"status line
set laststatus=2
set t_Co=256
let g:airline_theme='solarized'
set encoding=utf-8
let g:airline_powerline_fonts = 1
"set font
let islinux=system("uname | grep -c Linux")
if islinux
  set guifont=Ubuntu\ Mono\ derivative\ Powerline
else
  set guifont=Monaco\ for\ Powerline
  set clipboard=unnamed
endif

"vim-latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_FoldedSections     = ""
let g:Tex_FoldedEnvironments = ""
let g:Tex_FoldedMisc         = ""
" vim-latex
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_MultipleCompileFormats = "pdf"
let g:Tex_GotoError = 0

"tagbar
let g:tagbar_sort = 0
nmap <F6> :TagbarToggle<CR>

"youcompleteme
"python with virtualenv support
" py << EOF
" import os, sys
" if sys.platform=='darwin':
"   sys.path.insert(0, "/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages")
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF

nnoremap <leader>yf :let g:ycm_auto_trigger=0<CR>                " turn off YCM
nnoremap <leader>yo :let g:ycm_auto_trigger=1<CR>                "turn on YCM
let g:ycm_auto_trigger=0
let g:ycm_key_invoke_completion = '<C-l>'
if islinux
  let g:ycm_server_python_interpreter='/usr/bin/python'
  let g:ycm_python_binary_path = '/usr/bin/python'
else
  " let g:ycm_server_python_interpreter='/Library/Frameworks/Python.framework/Versions/2.7/bin/python'
  " let g:ycm_python_binary_path = '/Library/Frameworks/Python.framework/Versions/2.7/bin/python'
  let g:ycm_server_python_interpreter='/usr/local/bin/python'
  let g:ycm_python_binary_path = '/usr/local/bin/python'
endif
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_goto_buffer_command = 'new-tab'
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

"diffchar
let g:DiffUnit='Char'

"jedi
let g:jedi#completions_enabled = 0
let g:jedi#use_tabs_not_buffers = 1


" neovim
if has('nvim')
  " Completion
  let g:deoplete#enable_at_startup = 1
  let g:jedi#completions_command = "<C-l>"
  let g:SuperTabContextDefaultCompletionType = "<c-n>"
  let g:SuperTabDefaultCompletionType = "<c-n>"

  " neoterm
  map <leader>t :Ttoggle <CR>
endif


"vim-ipython
let g:ipy_perform_mappings = 0
let g:ipy_autostart = 0

"NERDtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>nt :NERDTreeToggle<CR>

"NERDcommenter
"Usages
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

set completeopt=longest,menuone


" templates
autocmd bufnewfile *.py 0r $HOME/.vim/templates/python.temp

" Mapping keys
nnoremap <F5> <ESC>:w<CR>
nnoremap <leader>s <ESC>:w<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <leader>j <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <leader>k <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <leader>l <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>h <C-W><C-H>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <F3> :w !detex \| wc -w<CR>
nnoremap <silent> <F2> <ESC>:call _saveExit()<CR><CR>
nnoremap <silent><leader>p :call _CloseQuit()<CR><CR>
nnoremap <leader>o <Esc>:call _CloseNonFileBuf()<CR>


" Functions
"close all the rest buffers
function! _CloseNonFileBuf()
  if (&buftype == "nofile")
    exe ":q"
    exe ":call _CloseNonFileBuf()"
  else
    exe ":only"
  endif
endfunction
"save changes and exit
function! _saveExit()
  if (&mod == 1)
    let choice = confirm("Save before exit?", "&1 Save\n&2 No\n&3 Cancel", 3)
    if (choice == 0)||(choice == 3)
      exe ":echo \"Abort quitting\""
    elseif (choice == 1)
      exe ":x"
    elseif (choice == 2)
      exe ":q!"
    endif
  else
    exe ":quit"
  endif
endfunction
"quit vim
function! _CloseQuit()
  if (&buftype == "nofile")
    exe ":q"
  else
    exe ":only"
    exe "call _saveExit()"
  endif
endfunction
"join lines with ,
function! JoinList(arg) range
  execute a:firstline  . "," . (a:lastline - 1) . 's/$/'.a:arg.'/ '
  execute a:firstline  . "," . (a:lastline) . 'join'
endfunction

vmap <silent>ll :call JoinList(',')<CR><CR>
nnoremap <silent><leader>p :set paste!<CR><CR>

" autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
" According to
" (http://vim.wikia.com/wiki/Always_start_on_first_line_of_git_commit_message)
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" au BufWinLeave * mkview
" au BufWinEnter * silent loadview
" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

function! RunFile()
  if !empty(glob("SConstruct")) && !empty(system("which scons"))
    execute "!scons"
  elseif !empty(glob("Makefile")) || !empty(glob("makefile"))
    execute "!make"
  else
    let g:fileext=expand('%:e')
    if (g:fileext == "py")
      if has("nvim")
        nnoremap <F9> :call NvimRun() <CR>
      else
        execute "!python %"
      endif
    elseif (g:fileext == "tex")
      call Build_TeX()
    endif
  endif
endfunction
nnoremap <F9> :call RunFile() <CR>

" Disable folding
set nofoldenable
