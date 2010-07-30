" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim rather than Vi settings. Note that this must be first, because it
" changes other options as a side effect.
set nocompatible

" Turn off all audible bells.
set noerrorbells visualbell t_vb=

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    augroup END

else

    " Always set auto-indenting on.
    set autoindent

endif " has("autocmd")


if version >= 700
  " Turn on spell checking if it hasn't been enabled yet.
  if !exists("spell_on")
    set spell
  endif
endif

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash




" Automatically cd to directory of the buffer.
if exists('+autochdir') 
    set autochdir 
else 
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ / 
endif


if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set autoread        " Automatically read files changed outside of Vim.

set hidden          " Don't require writing a buffer before putting it in the
                    " background.

set history=1000    " How much command and search history to keep?
set ruler		    " Show the cursor position all the time.
set showcmd		    " Display incomplete commands.

" Use ack instead of grep
set grepprg=ack\ -H\ --nocolor\ --nogroup\ --ignore-case
set grepformat=%f:%l:%m

" Grep is actually delegated to the ack.vim plugin. Provide a shortcut to start
" the search
map <leader>g :Ack<space>

" Remap ` and ' to remember column positions for markers in the common case.
nnoremap ' `
nnoremap ` '

set title           " Set the title in a shell.

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Keep swapfiles in one directory, not littered all over the file system.
set backupdir=~/.vimswaps//,/tmp//
set directory=~/.vimswaps//,/tmp//

" Sane handling of whitespace.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Display a '$' when changing characters.
set cpo+=$

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Configure the status line show something useful.
set statusline=%F%m%r%h%w\ %y\ [%{&ff}]%=[%l,%v][%p%%]\ [%L] 
set laststatus=2    " Ensure status line is visible.

" Searches are case-insensitive if all lowercase. If contain mixed-case,
" search becomes case-sensitive. Only works with 'set ignorecase'.
set smartcase
set ignorecase

" Incremental searching.
set incsearch

" Create a command to toggle search highlighting on and off as desired.
function ToggleHLSearch()
    if &hlsearch
        set nohlsearch
    else
        set hlsearch
    endif
endfunction
nmap <silent> <C-s> <Esc>:call ToggleHLSearch()<CR>

" Make trailing whitespace visible on request.
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Shortcuts for previous and next buffers, respectively.
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>

" Flip to the previous buffer more easily
nmap <leader>b <C-^><CR>

" The h and l keystrokes can be made to wrap over lines (so that trying to
" move left past the beginning of a line puts the cursor at the end of the
" line above). This command does that, and also allows ~ (convert case) to
" wrap over lines, and the cursor keys to wrap when in insert mode:
set whichwrap=h,l,~,[,]

" Set a wrap margin of 4 characters at the end of each line.
set wm=2

" Get useful auto-completion in command mode.
set wildmenu
set wildmode=list:longest,full

" Load color scheme. Note that this will be overridden by .gvimrc when not in
" the terminal.
colorscheme candy

" Quickly expand or collapse the current fold.
:nnoremap <space> za

" Re-format paragraph, preserving cursor position.
:nmap Q gwap

" Ctrl-. repeats the last macro, assumed to be saved as 'q'.
map <C-.> <ESC>@q

" Abbreviation for inserting the current date.
iab xdate <c-r>=strftime("%F %H:%M:%S")<cr>

" Turn off spell checking in the quick fix window
autocmd FileType qf set nospell


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" Insert mode navigation                                                       "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

ino <silent> <c-b> <c-o>b
ino <silent> <c-f> <esc>ea
ino <c-h> <left>
ino <c-l> <right>
ino <c-k> <c-o>D




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" Window navigation                                                            "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Moving to different windows
nmap <C-l> <C-W>l
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k

" Resizing windows
nmap <C-_> <C-W>-
nmap <C-+> <C-W>+




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" Compiling programs                                                           "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>m :make<cr>
map <D-'> :cnext<cr>
map <D-"> :cprevious<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" Filetypes                                                                    "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on omni-completion for the appropriate file types.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1  " Rails support


"
" Objective-C
"

autocmd FileType objc nmap <leader>t :call ToggleHeaderOrImplFile()<CR>
autocmd FileType objc set makeprg=rake
autocmd FileType objc set tags+=tags;$HOME
autocmd FileType objc nmap <c-L> :ListMethods<CR>



"
" Make
"

" Turn off tab expansion for Makefiles
autocmd FileType make setlocal noexpandtab

"
" Arc
"
autocmd BufNewFile,BufRead *.arc set ft=arc

"
" Mako Python templates.
"
autocmd BufNewFile,BufRead *.mako set filetype=mako

"
" Lisp
"
autocmd BufRead *.lsp,*.lisp so ~/.vim/ftplugin/VIlisp.vim

"
" Scheme
"
if exists("b:is_mzscheme") || exists("is_mzscheme")

    " improve indenting
    setl iskeyword+=#,%,^
    setl lispwords+=module,parameterize,let-values,let*-values,letrec-values
    setl lispwords+=define-values,opt-lambda,case-lambda,syntax-rules,with-syntax,syntax-case
    setl lispwords+=define-signature,unit,unit/sig,compund-unit/sig,define-values/invoke-unit/sig

endif


"
" Markdown
"
au! BufRead,BufNewFile *.mkd setfiletype mkd
autocmd BufNewFile,BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>


"
" HTML
"
autocmd FileType xhtml set shiftwidth=2
autocmd FileType xhtml set tabstop=2
autocmd FileType xhtml set softtabstop=2


"
" LaTeX
"
if has('mac')
    " FIX: There's an issue with latex-suite finding the PDF viewer on Macs.
    let Tex_ViewRule_pdf = 'open $*.pdf'
endif

" FIX: Vim7 has a problem detecting the filetype correctly when editing a new
" LaTex document
let g:tex_flavor='latex'


"
" Java
"
autocmd BufNewFile,BufRead *.java set makeprg=ant\ -emacs\ -find\ build.xml\ build

autocmd BufRead *.java abbr sysout System.out.println
autocmd BufRead *.java abbr Sysout System.out.println
autocmd BufRead *.java set include=^#\s*import
autocmd BufRead *.java set includeexpr=substitute(v:fname,'\\.','/','g')
autocmd BufRead *.java map gf f
autocmd BufRead *.java map gc gdbf


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" Plugins                                                                      "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" neocomplcache
"
let g:NeoComplCache_EnableAtStartup = 1
" Use smartcase.
let g:NeoComplCache_SmartCase = 1
" Use previous keyword completion.
let g:NeoComplCache_PreviousKeywordCompletion = 1
" Use preview window.
let g:NeoComplCache_EnableInfo = 1
" Use camel case completion.
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" Don't use underbar completion.
let g:NeoComplCache_EnableUnderbarCompletion = 0
" Set minimum syntax keyword length.
let g:NeoComplCache_MinSyntaxLength = 3
" Set skip input time.
let g:NeoComplCache_SkipInputTime = '0.1'

" Plugin key-mappings.
imap <silent><C-l>     <Plug>(neocomplcache_snippets_expand)
smap <silent><C-l>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
inoremap <expr><silent><C-g>     neocomplcache#undo_completion()

" Use Tab for completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"
" LustyJuggler
" Ignore vim compiled without ruby (Mac OS X 10.6.2 vim does not contain ruby)
"
let g:LustyJugglerSuppressRubyWarning = 1

"
" vimwiki
"
let g:vimwiki_list = [{'path': '~/Documents/Wiki/', 'path_html': '~/Sites/wiki/'}]
