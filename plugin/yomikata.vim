if !executable('yomikata')
  finish
endif

function! s:yomikata(word) abort
  echohl Title | echo a:word "is..." | echohl None
  echo system('yomikata ' . shellescape(a:word))
endfunction

nnoremap <silent> <plug>(yomikata) :<c-u>call <SID>yomikata(expand('<cword>'))<cr>
if get(g:, 'yomikata_default_mapping', 1)
  nmap <leader>y <plug>(yomikata)
endif
