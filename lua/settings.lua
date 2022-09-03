-- vim:fdm=marker:foldlevel=0
-- SETTING ==========================================================
-- general setting {{{
local opt = vim.opt
opt.shell = "/usr/local/bin/zsh"
opt.autoread = true
vim.cmd("set clipboard+=unnamed")
opt.pumblend = 20 -- transparency in popup window
opt.compatible = false
opt.syntax = "on"
opt.mouse = "a"
opt.undofile = true
opt.hidden = true -- disable save confirmation
opt.autochdir = true
-- }}} --------------------------------------------------------------
-- colors {{{
-- Color palette: https://www.ditig.com/256-colors-cheat-sheet
vim.cmd ('autocmd VimEnter * nested colorscheme moonfly')
vim.cmd ('autocmd WinEnter * nested colorscheme moonfly')
vim.cmd ('autocmd WinLeave * nested colorscheme fogbell')
opt.termguicolors = true
--[[
	vim.cmd("highlight! NonText			ctermbg=none guibg=none") -- for eol, extends, precedes listchars
	vim.cmd("highlight! Whitespace		ctermbg=none guibg=none") -- for nbsp, space, tab, trails listchars
	vim.cmd("highlight! lineNr			ctermbg=none guibg=none")
	vim.cmd("highlight! CursorLineNr	ctermbg=none guibg=none")
	vim.cmd("highlight! SignColumn		ctermbg=None guibg=None")
	vim.cmd("highlight! VertSplit		ctermfg=234  ctermbg=234  guifg=#1c1c1c guibg=#1c1c1c")
	vim.cmd("highlight! Visual			ctermfg=none ctermbg=90   guifg=none    guibg=#870087")
	vim.cmd("highlight NonText      ctermfg=246  ctermbg=none guifg=#949494 guibg=none") -- for eol, extends, precedes listchars
	vim.cmd("highlight Whitespace   ctermfg=7    ctermbg=none guifg=#c0c0c0 guibg=none") -- for nbsp, space, tab, trails listchars
	vim.cmd("highlight lineNr       ctermfg=250  ctermbg=none guifg=#bcbcbc guibg=none")
	vim.cmd("highlight CursorLineNr ctermfg=111  ctermbg=none guifg=#87afff guibg=none")
	vim.cmd("highlight SignColumn   ctermfg=none ctermbg=None guifg=none    guibg=None")
	vim.cmd("highlight VertSplit    ctermfg=234  ctermbg=234  guifg=#1c1c1c guibg=#1c1c1c")
	vim.cmd("highlight Visual       ctermfg=none ctermbg=90   guifg=none    guibg=#870087")
	]]
vim.cmd([[autocmd BufLeave * set nocursorline]])
-- vim.cmd ('autocmd InsertEnter * highlight CursorLine ctermbg=24  guibg=#005f87')
vim.cmd ('autocmd InsertLeave * highlight CursorLine ctermbg=236 guibg=#303030')
-- }}} --------------------------------------------------------------
-- editor space {{{
vim.cmd([[command! -nargs=* T split | wincmd j | resize 20 | terminal <args>]])
vim.cmd([[autocmd TermOpen * startinsert]])
opt.wrap = false
opt.whichwrap = "b,s,h,l,<,>,[,]"
opt.backspace = "indent,eol,start"
opt.tabstop = 4
opt.shiftwidth = 0
opt.softtabstop = 4
opt.showtabline = 2
-- vim.cmd ('set expandtab')
opt.autoindent = true
opt.smartindent = true
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.foldenable = true
opt.foldlevelstart = 0
opt.foldnestmax = 10
opt.foldmethod = "syntax"
opt.mat = 1
opt.list = true
opt.listchars = {tab = "| ", trail = "〿", extends = "»", precedes = "«", nbsp = "%"}   -- eol:↲,▸·▮"
opt.fillchars = {fold = " ", vert = "│", eob = " ", msgsep = "‾"} -- hide end-of-buffer tilde"
--opt.guicursor = {i = ver1, a = blinkon100}
opt.updatetime = 100
vim.cmd("autocmd InsertLeave,VimEnter,BufWinEnter,WinEnter,CmdlineLeave * :call system('im-select com.google.inputmethod.Japanese.Roman')")
-- cursorline only for current pane
vim.cmd([[
	set cursorline
	highlight clear CursorLine
	augroup vimrc_set_cursorline_only_active_window
	autocmd!
	autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
	augroup END
	]])
-- auto-formatting
vim.cmd([[
	autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
	autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
	autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
	]])
-- }}} --------------------------------------------------------------
-- [s]ide column {{{
opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes:1"
-- set foldcolumn=1
-- }}} --------------------------------------------------------------
-- [b]ottom line {{{
-- status line
opt.showmode = false
opt.laststatus = 3

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- cmd
opt.wildmode = {longest = full, full}
opt.wildmenu = true
opt.wildignorecase = true
-- }}} --------------------------------------------------------------
-- [u]ser commands {{{
vim.cmd('command! Conf :source $MYVIMRC <bar> :doautocmd BufRead')
vim.cmd('command! ConfEdit :e $MYVIMRC')
-- gf also opens non-existing files {{{
vim.cmd([[
	function! GF()
	try
	execute "normal! gf"
	catch /E447:/
	let cfile = expand("<cfile>")
	execute "edit " . cfile
	catch
	echo "error. Chk script in init.vim"
	endtry
	endfunction
	command! GF call GF()
]])
-- }}}
-- }}} --------------------------------------------------------------
