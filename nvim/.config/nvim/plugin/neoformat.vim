let g:neoformat_try_node_exe = 1

let g:neoformat_javascript_prettier = {
  \ 'exe': './node_modules/.bin/prettier',
  \ 'args': ['--write', '--config .prettierrc.json'],
  \ 'replace': 1
  \ }

"let g:neoformat_typescript_prettier = {
"  \ 'exe': './node_modules/.bin/prettier',
"  \ 'args': ['--write', '--config .prettierrc.json'],
"  \ 'replace': 1
"  \ }

"Neoformat
augroup neoformat
  autocmd!
  autocmd BufWritePre * undojoin|Neoformat prettier
augroup END
