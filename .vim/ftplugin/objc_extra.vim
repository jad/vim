"
" Adopted from:
"   http://vim.wikia.com/wiki/Easily_switch_between_source_and_header_file
"

"
" If we've already been here, exit.
"
if exists("*ToggleHeaderOrImplFile")
	finish
endif

function! ToggleHeaderOrImplFile()
  if (expand ("%:t") == expand ("%:t:r") . ".m")
    find %:t:r.h
  else
    find %:t:r.m
  endif
endfunction
