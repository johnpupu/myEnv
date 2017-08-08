" File:         tronice.vim
" URL:
" Author:       Tronice Co., Ltd.
" License:      MIT
"
" Copyright (c) 2017 Tronice Co., Ltd.
"
" MIT License
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "tronice"
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
hi DiffAdd term=reverse cterm=bold ctermbg=22 ctermfg=white
hi DiffChange term=reverse cterm=bold ctermbg=25 ctermfg=white
hi DiffText term=reverse cterm=bold ctermbg=130 ctermfg=white
hi DiffDelete term=reverse cterm=bold ctermbg=88 ctermfg=white
hi TabLine           cterm=underline ctermfg=15    ctermbg=242
hi TabLineSel        cterm=bold      ctermfg=45
hi TabLineFill       cterm=reverse
hi TabLineMore       cterm=underline ctermfg=White ctermbg=236
