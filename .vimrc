execute pathogen#infect()

"if &term =~ "xterm"
"    if has ("terminfo")
"        set t_Co=16
"        set t_AF=^[[%?%p1%{8}%<%t3%p1%d%e%p1%{22}%+%d;1%;m
"        set t_AB=^[[%?%p1%{8}%<%t4%p1%d%e%p1%{32}%+%d;1%;m
"    else
"        set t_Co=16
"        set t_Sf=<Esc>[3%dm
"        set t_Sb=<Esc>[4%dm
"    endif
"
"    syntax on
"endif
"
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
"set fileencodings=utf-8,big5,gbk,sjis,euc-jp,euc-kr,utf-bom,iso8859-1
"set encoding=utf-8
"set termencoding=utf-8
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

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "koehler"
hi Normal     guifg=white  guibg=black
hi Scrollbar    guifg=darkcyan guibg=cyan
hi Menu       guifg=black guibg=cyan
hi SpecialKey   term=bold  cterm=bold  ctermfg=darkred  guifg=Blue
hi NonText      term=bold  cterm=bold  ctermfg=darkred  gui=bold  guifg=Blue
hi Directory    term=bold  cterm=bold  ctermfg=brown  guifg=Blue
hi ErrorMsg     term=standout  cterm=bold  ctermfg=grey  ctermbg=blue  guifg=White  guibg=Red
hi Search     term=reverse  ctermfg=white  ctermbg=red  guifg=white  guibg=Red
hi MoreMsg      term=bold  cterm=bold  ctermfg=darkgreen  gui=bold  guifg=SeaGreen
hi ModeMsg      term=bold  cterm=bold  gui=bold  guifg=White  guibg=Blue
hi LineNr     term=underline  cterm=bold  ctermfg=darkcyan  guifg=Yellow
hi Question     term=standout  cterm=bold  ctermfg=darkgreen  gui=bold  guifg=Green
hi StatusLine   term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi StatusLineNC   term=reverse  ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi Title      term=bold  cterm=bold  ctermfg=darkmagenta  gui=bold  guifg=Magenta
hi Visual     term=reverse  cterm=reverse  gui=reverse
hi WarningMsg   term=standout  cterm=bold  ctermfg=blue  guifg=Red
hi Cursor     guifg=bg  guibg=Green
hi Comment      term=bold  cterm=bold ctermfg=cyan  guifg=#80a0ff
hi Constant     term=underline  cterm=bold ctermfg=magenta  guifg=#ffa0a0
hi Special      term=bold  cterm=bold ctermfg=red  guifg=Orange
hi Identifier   term=underline   ctermfg=brown  guifg=#40ffff
hi Statement    term=bold  cterm=bold ctermfg=yellow  gui=bold  guifg=#ffff60
hi PreProc      term=underline  ctermfg=blue  guifg=#ff80ff
hi Type       term=underline  cterm=bold ctermfg=lightgreen  gui=bold  guifg=#60ff60
hi Error      term=reverse  ctermfg=darkcyan  ctermbg=black  guifg=Red  guibg=Black
hi Todo       term=standout  ctermfg=black  ctermbg=darkcyan  guifg=Blue  guibg=Yellow
hi link IncSearch   Visual
hi link String      Constant
hi link Character   Constant
hi link Number      Constant
hi link Boolean     Constant
hi link Float     Number
hi link Function    Identifier
hi link Conditional   Statement
hi link Repeat      Statement
hi link Label     Statement
hi link Operator    Statement
hi link Keyword     Statement
hi link Exception   Statement
hi link Include     PreProc
hi link Define      PreProc
hi link Macro     PreProc
hi link PreCondit   PreProc
hi link StorageClass  Type
hi link Structure   Typedd
hi link Typedef     Type
hi link Tag       Special
hi link SpecialChar   Special
hi link Delimiter   Special
hi link SpecialComment  Special
hi link Debug     Special
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

au FileType javascript so ~/.vim/indent/javascript.vim

"for textmate, plugin
filetype on
filetype plugin on
filetype indent on
"change gf buffer open to tabedit
nmap gf :tabedit <cfile><CR>

"Folding
set foldenable

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
nmap <F5> <Plug>HexManager
nmap <F6> :set ft=php<CR>
nmap <F7> :set ft=javascript<CR>
nmap <F8> :set ft=html<CR>
"nmap <F9> :set mouse=<CR>
"nmap <F10> :set mouse=n<CR>
nmap <F11> :set nopaste<CR>
nmap <F12> :set paste<CR>

" toggle ctrl k to show number
nnoremap <C-k> :set nonumber!<CR>

hi DiffAdd term=reverse cterm=bold ctermbg=22 ctermfg=white
hi DiffChange term=reverse cterm=bold ctermbg=25 ctermfg=white
hi DiffText term=reverse cterm=bold ctermbg=130 ctermfg=white
hi DiffDelete term=reverse cterm=bold ctermbg=88 ctermfg=white

" set leader to ,
let mapleader=","
let g:mapleader=","

nmap <leader>/ :nohl<CR>

set tabpagemax=256

hi TabLine           cterm=underline ctermfg=15    ctermbg=242
hi TabLineSel        cterm=bold      ctermfg=45
hi TabLineFill       cterm=reverse
hi TabLineMore       cterm=underline ctermfg=White ctermbg=236

" tabline plugin
let g:tabline_tab_max_width=0
let g:tabline_scroll_off=5

" EasyClip plugin
let g:EasyClipAutoFormat=0
let g:EasyClipDoSystemSync=0

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
