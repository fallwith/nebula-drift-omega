" Nebula Drift: Rosette sample Vim script
if exists('g:loaded_nebula_sample')
  finish
endif
let g:loaded_nebula_sample = 1

let s:palette = {
      \ 'keyword': '#C43030',
      \ 'string': '#E8D080',
      \ 'comment': '#4A3A6A',
      \ 'identifier': '#8AB4E8',
      \ }

function! s:EchoTheme(name) abort
  if empty(a:name)
    echohl WarningMsg
    echom "No theme name provided"
    echohl None
    return
  endif

  echohl Identifier
  echom printf("Loaded theme: %s", a:name)
  echohl None
endfunction

function! s:DumpPalette() abort
  for [l:key, l:hex] in items(s:palette)
    echom printf('%-12s %s', l:key, l:hex)
  endfor
endfunction

command! NebulaPreview call s:EchoTheme('nebula_drift_rosette') | call s:DumpPalette()

augroup NebulaDriftPreview
  autocmd!
  autocmd VimEnter * call s:EchoTheme('nebula_drift_rosette')
  autocmd ColorScheme * if g:colors_name ==# 'nebula_drift_rosette' | call s:DumpPalette() | endif
augroup END

highlight link NebulaAccent Statement
nnoremap <silent> <leader>nr :colorscheme nebula_drift_rosette<CR>
nnoremap <silent> <leader>np :NebulaPreview<CR>

for s:group in ['Comment', 'Statement', 'Function', 'Type', 'String']
  if hlexists(s:group)
    execute 'silent! hi' s:group
  endif
endfor

try
  if exists('+termguicolors')
    set termguicolors
  endif
catch /^Vim\%((\a\+)\)\=:E/
  echom v:exception
finally
  unlet! s:group
endtry
