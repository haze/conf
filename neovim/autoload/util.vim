scriptencoding utf-8
" Utility functions

" Report the highlight groups active at the current point
function! util#syntax_stack() abort
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunc

" Operator function to yank directly to the clipboard via the + register
function! util#clipboard_yank(type, ...) abort
  let sel_save = &selection
  let &selection = 'inclusive'
  if a:0 " Invoked from visual mode
    silent execute 'normal! "+y'
  else " Invoked with a motion
    silent execute 'normal! `[v`]"+y'
  endif

  let &selection = sel_save
endfunction
