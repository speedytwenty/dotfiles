au BufRead,BufNewFile *.js,*.jsx setlocal filetype=javascript

" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

" Linting
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_set_highlights = 0
 
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 0
