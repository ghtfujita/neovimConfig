vim.cmd([[
let g:better_whitespace_enabled=0 " highlighting
autocmd FileType * EnableStripWhitespaceOnSave
let g:strip_whitespace_confirm=0
" let g:strip_only_modified_lines=1
let g:strip_whitelines_at_eof=1
]])
