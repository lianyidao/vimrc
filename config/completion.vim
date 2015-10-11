call neobundle#append()
  NeoBundle 'Valloric/YouCompleteMe', {
  \ 'build'      : {
     \ 'mac'     : './install.py --clang-completer --omnisharp-completer',
     \ 'unix'    : './install.py --clang-completer --omnisharp-completer',
     \ }
  \ }
call neobundle#end()

" YCM
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = ']]'
let g:ycm_enable_diagnostic_signs = 0
nnoremap ,g :YcmCompleter GoToDeclaration <CR>
nnoremap ,G :YcmCompleter GoToDefinition <CR>