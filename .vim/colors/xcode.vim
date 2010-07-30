" Vim color file
"
" Maintainer:   John Debay <john@debay.net>
" Last Change:  29 July 2010
"

set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="xcode"


"= Syntax Groups =============================================

hi comment      guibg=#ffffff   guifg=#008425   gui=none

hi constant     guibg=#ffffff   guifg=#31595d   gui=none
hi specialchar  guibg=#ffffff   guifg=#ff3333   gui=underline

" In objc, this only seems to apply to leading '-' and '+' in front of method
" names.
hi identifier   guibg=#ffffff   guifg=#000000   gui=none

" self, selector, etc.
hi statement    guibg=#ffffff   guifg=#bb2d9d   gui=none
hi label        guibg=#000000   guifg=#3333ff   gui=none

hi preproc      guibg=#ffffff   guifg=#78482f   gui=none
hi include      guibg=#ffffff   guifg=#78482F   gui=none
hi precondit    guibg=#000000   guifg=#78482f   gui=none

" void, BOOL, id, (for objective-c) etc.
hi type         guibg=#ffffff   guifg=#bb2d9d   gui=none

" format specifiers in printf-style strings
hi special      guibg=#ffffff   guifg=#cc00cc   gui=underline

hi error        guibg=#ff3333   guifg=#ffffff   gui=none

hi todo         guibg=#339933   guifg=#ffffff   gui=none


"= General Groups ============================================

hi cursor       guibg=#000000   guifg=#ffffff   gui=none

hi directory    guibg=#fafafa   guifg=#3333ff   gui=none

hi diffadd      guibg=#66ff66   guifg=#000000   gui=none
hi diffdelete   guibg=#ff6666   guifg=#ff6666   gui=none
hi diffchange   guibg=#ffff00   guifg=#cccc99   gui=none
hi difftext     guibg=#ffff00   guifg=#000000   gui=none

hi errormsg     guibg=#ff3333   guifg=#ffffff   gui=none

hi vertsplit    guibg=#3333ff   guifg=#3333ff   gui=none

hi folded       guibg=#eeeeee   guifg=#3333ff   gui=none
hi foldcolumn   guibg=#eeeeee   guifg=#999999   gui=none

hi linenr       guibg=#fafafa   guifg=#bbbbbb   gui=none

hi modemsg      guibg=#fafafa   guifg=#999999   gui=none

hi moremsg      guibg=#339900   guifg=#ffffff   gui=none
hi question     guibg=#339900   guifg=#ffffff   gui=none

hi nontext      guibg=#fafafa   guifg=#999999   gui=none

hi normal       guibg=#fafafa   guifg=#000000   gui=none

hi search       guibg=#ffff00   guifg=#000000   gui=none
hi incsearch    guibg=#ffbb00   guifg=#000000   gui=none

hi specialkey   guibg=#fafafa   guifg=#cc00cc   gui=none

hi statusline   guibg=#3333ff   guifg=#ffffff   gui=none
hi statuslinenc guibg=#3333ff   guifg=#999999   gui=none

hi title        guibg=#fafafa   guifg=#6666ff   gui=none

hi visual       guibg=#bbbbbb   guifg=#333333   gui=none

hi warningmsg   guibg=#fafafa   guifg=#ff0000   gui=none

hi wildmenu     guibg=#339900   guifg=#ffffff   gui=none


" [eof]

