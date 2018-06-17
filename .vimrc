execute pathogen#infect()

" ================================= Vim-Plug =================================
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" install Vundle bundles
if filereadable(expand("~/.vim/.vimrc.bundles"))
  source ~/.vim/.vimrc.bundles
endif

" Initialize plugin system
call plug#end()
" ================================= Vundle =================================

" 自動偵測是否是 paste, 若是則自為轉為 paste mode
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

syntax on
" 256 color
set t_Co=256
set t_AB=[48;5;%dm
set t_AF=[38;5;%dm
map tn :tabnext
map tp :tabprev
map to :tabnew
map tc :tabclose
nmap L <End>
nmap H <Home>
set history=200
set ai
set ruler
set cin
set dir=/tmp
set hls
"set ch=2
"set softtabstop=4
"set shiftwidth=4
"set tabstop=4 shiftwidth=4 softtabstop=4
set tabstop=4 shiftwidth=4 softtabstop=0
"set ignorecase
"set expandtab

" TAB setting{
"   set expandtab "replace <TAB> with spaces
"   set softtabstop=4
"   set shiftwidth=4

"   au FileType Makefile set noexpandtab
"} 
set bs=2    " allow backspacing over everything in insert mode
set ts=2
set ff=unix
set nobk
"set encoding=big5
"set fileencoding=big5
"set fileencodings=big5,utf-8,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
"set termencoding=big5
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8
set ambiwidth=double
"set <C-u>=^U
"set <C-b>=^B
"map <C-u> :set enc=utf-8<CR> :set termencoding=utf-8<CR> :set fileencoding=utf-8<CR>
"map <C-b> :set enc=big5<CR> :set termencoding=big5<CR> :set fileencoding=big5<CR>
set guifontset=-sgi-screen-medium-r-normal-*-14-*-*-*-*-*-iso8859-1,-*-mingliu-medium-r-normal-*-14-*-*-*-c-*-big5-0
"set mouse=n

" 使用面板
colorscheme tronice

" Hilight for tabline
" hi TabLine guifg=#90fff0 guibg=#2050d0     ctermfg=black ctermbg=white
" hi TabLineSel guifg=#90fff0 guibg=#2050d0     ctermfg=white ctermbg=blue
"set cursorline
"hi cursorline cterm=none ctermbg=gray
""------Restore cursor to file position in VIM
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"設定副檔名為 XXX 時，為什麼檔案
au BufNewFile,BufRead *.tpl :set ft=php " all my .tpl files ARE html
au BufNewFile,BufRead *.ini :set ft=php " all my .tpl files ARE html
au BufNewFile,BufRead *.phtml :set ft=html " all my .tpl files ARE html
au BufNewFile,BufRead *.php :set ft=php " all my .tpl files ARE html

"au FileType javascript so ~/.vim/indent/javascript.vim

"for textmate, plugin
filetype on
filetype plugin on
filetype indent on
"change gf buffer open to tabedit
nmap gf :tabedit <cfile><CR>

"Folding
"set foldenable

"Highlight SQL syntax in string
let php_sql_query=1
"Highlight HTML in string
let php_htmlInStrings=1
"Folding for classes & functions
"let php_folding=1
nnoremap <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>

" status bar
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m " file format & bomb detect
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

nmap <F1> :tabprev<CR>
nmap <F2> :tabnext<CR>
nmap <F3> :tabnew 
nmap <F4> :tabclose<CR>
nmap <F6> :set ft=php<CR>
nmap <F7> :set ft=javascript<CR>
nmap <F8> :set ft=html<CR>
"nmap <F9> :set mouse=<CR>
"nmap <F10> :set mouse=n<CR>
nmap <F11> :set nopaste<CR>
nmap <F12> :set paste<CR>

" toggle ctrl k to show number
nnoremap <C-k> :set nonumber!<CR>

" set leader to ,
let mapleader=","
let g:mapleader=","

nmap <leader>/ :nohl<CR>

set tabpagemax=256

" pietty 右鍵貼上
set mouse-=a

" no incsearch
set nois

" set undodir
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" tabline plugin config
if filereadable(expand("~/.vim/.vimrc.tabline"))
  source ~/.vim/.vimrc.tabline
endif

" EasyClip plugin config
if filereadable(expand("~/.vim/.vimrc.easyclip"))
  source ~/.vim/.vimrc.easyclip
endif

" vim-easy-align
if filereadable(expand("~/.vim/.vimrc.vim-easy-align"))
  source ~/.vim/.vimrc.vim-easy-align
endif
