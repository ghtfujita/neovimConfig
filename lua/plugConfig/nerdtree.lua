-- nerdtree setting
vim.cmd([[
" Start NERDTree when Vim is started without file arguments.
	"autocmd StdinReadPre * let s:std_in=1
	"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
	"autocmd StdinReadPre * let s:std_in=1
	"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Start NERDTree when Vim starts with a directory argument.
	"autocmd StdinReadPre * let s:std_in=1
	"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
	"\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter *if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let NERDTreeStatusline="%8*%=%7*%8*%="
let NERDTreeMinimalUI=1
let g:NERDTreeHighlightCursorline = 0
]])

-- nerdtree-git -plugin setting
vim.cmd([[
let g:NERDTreeGitStatusUseNerdFonts = 1
]])

-- vim-nerdtree-syntax-highlight setting
-- vim.cmd([[
-- let g:NERDTreeFileExtensionHighlightFullName = 1
-- let g:NERDTreeExactMatchHighlightFullName = 1
-- let g:NERDTreePatternMatchHighlightFullName = 1
-- let g:NERDTreeLimitedSyntax = 1
-- ]])
