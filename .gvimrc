" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Customize font for Mac OS X
" Inconsolata is downloadable here:
"   http://www.levien.com/type/myfonts/inconsolata.html
"set anti enc=utf-8 gfn=Inconsolata:h13
set anti enc=utf-8 gfn=Menlo\ Regular:h11

" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
  syntax on
endif


set hlsearch                " Switch on search pattern highlighting.
set number                  " Turn on line numbers
set numberwidth=5           " By default can fit at least 9999 lines
set lines=65                " Make our GUI window reasonably tall
set columns=85              " 80 columns + room for line numbers
set ch=2                    " Make command line two lines high
set mousehide               " Hide the mouse when typing text
set lazyredraw              " Don't redraw screen during macros
set ttyfast                 " Improves redrawing for newer computers


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" Display settings                                                             "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if v:version > 700
    " Highlight the background of the current line
    set cursorline
    hi Cursorline ctermbg=Red guibg=#1c1c1c
    call ExpextCursorSlowDown(now)
endif

set transparency=0          " Set window alpha
set go-=T                   " Turn off the toolbar.

colorscheme xcode

"
" Display characters that are longer than 80 characters in a different color.
"
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" Managing windows                                                             "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ChangeColumns(delta)
    let &columns += (&columns + a:delta > 0) ? a:delta : 0
endfunction

function! AddVerticalWindows(n)
    let window_width = 86
    call ChangeColumns(a:n * window_width)

    if a:n > 0
        vsplit "%"
    elseif a:n < 0
        execute("wincmd c")
    endif
endfunction

nmap <silent> <leader>]] :call AddVerticalWindows(1)<CR>
nmap <silent> <leader>[[ :call AddVerticalWindows(-1)<CR>



"
" Customize the NERD Tree plugin.
"

let NERDChristmasTree = 1
let NERDTreeWinPos = "right"

function ToggleNerdTree(dir)
    call ChangeColumns(32)
    execute('NERDTreeToggle ' . a:dir)
endfunction

map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

"
" Customize the FuzzyFinder plugin.
"
let g:FuzzyFinderOptions.Base.abbrev_map  = {
            \   "^code-watch" : [
            \     "~/src/hob/code-watch/**/"
            \   ],
            \   "^bug-watch" : [
            \     "~/src/hob/bug-watch/**/"
            \   ],
            \ } 

function! MapFuzzyFinderFile()
    let l:wd = getcwd()
    echo "cwd: " . l:wd

    if l:wd =~ "code-watch"
        echo "Mapping to code watch"
        nmap Y :FuzzyFinderFile code-watch<CR>
    elseif l:wd =~ "bug-watch"
        echo "Mapping to bug watch"
        nmap Y :FuzzyFinderFile bug-watch<CR>
    endif
endfunction

autocmd BufReadPre * call MapFuzzyFinderFile()
