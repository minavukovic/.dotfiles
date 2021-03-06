set tabstop=4
syntax enable
set number
set autoindent
"set smartindent "insert new indentation if needed
set noerrorbells
set novisualbell
set t_vb= "turn off error flash
set showmode
set ignorecase
set nojoinspaces
set nowrap
set textwidth=100
set linebreak "set wrap to insert linebreak
set wildmenu "command autocompletion
set backspace=indent,eol,start
set whichwrap+=<,>h,l
set showmatch "highlight matching brackets
" set mouse=a
set relativenumber

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.h,*.c,*.java,*.vimrc,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.ino,*cs :call CleanExtraSpaces()
endif

" Save upon losing focus
au FocusLost * :wa

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_strings=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_termcolors=16
colorscheme gruvbox
set background=dark
highlight Normal guibg=black

" Expand tabs in C files to spaces
"au BufRead,BufNewFile *.{c,h,java} set expandtab
"au BufRead,BufNewFile *.{c,h,java} set shiftwidth=2
"au BufRead,BufNewFile *.{c,h,java} set tabstop=2

"vim pathogen latex auto compile package
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif




call plug#begin('~/.vim/plugged')

Plug 'https://github.com/junegunn/vim-plug.git'
Plug 'lervag/vimtex'
"Plug 'tpope/vim-surround'
"Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
"Plug 'jreybert/vimagit'
"Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
"Plug 'vifm/vifm.vim'
"Plug 'kovetskiy/sxhkd-vim'

call plug#end()
syntax on

let g:vimtex_view_general_options = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:latex_view_general_viewer = 'zathura'
let g:airline_theme='zenburn'

"let mapleader=" "

" Navigating with guides
"inoremap <leader><leader> <Esc>/<Enter>"_c4l
"vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
"map <leader><leader> <Esc>/<++><Enter>"_c4l
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

" latex snippets
"""LATEX
" Word count:
autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
" Code snippets
autocmd FileType tex inoremap ;frame \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fitch \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;emph \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bold \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ;ital \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;cite \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ;paren \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;enum \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;item \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;list <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;cand \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;const \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;vio \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;href \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;textsc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{<++>}<Enter><++><Enter>\end{<++>}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space><Enter>c<Esc>i
autocmd FileType tex inoremap ;usepac <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;texttt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;blindt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i
autocmd FileType tex inoremap ;$ $$$$<Space><++><Esc>hhhhhhi
autocmd FileType tex inoremap ;pg \pagebreak

" auto complete brackets
autocmd Filetype * inoremap ( ()<Space><++><Esc>T(i
autocmd Filetype * inoremap { {}<Space><++><Esc>T{i
autocmd Filetype * inoremap [ []<Space><++><Esc>T[i

autocmd Filetype markdown inoremap ;b ****<Space><++><Esc>6hi
autocmd Filetype markdown inoremap ;i **<Space><++><Esc>5hi
"autocmd Filetype * inoremap ;{ {<CR>}<Esc>ko<BS>

command P !~/.config/i3/pand.sh %
