-- vim:fdm=marker:foldlevel=0
-- KEYMAPS ==========================================================
-- local function definition {{{
local map = require('utils').map
local maps = require('utils').maps
local nmap = require('utils').nmap
local nmaps = require('utils').nmaps
local imap = require('utils').imap
local imaps = require('utils').imaps
local vmap = require('utils').vmap
local vmaps = require('utils').vmaps
local xmap = require('utils').xmap
local xmaps = require('utils').xmaps
local omap = require('utils').omap
local omaps = require('utils').omaps
local tmap = require('utils').tmap
local tmaps = require('utils').tmaps
local cmd = require('utils').cmd

-- }}} --------------------------------------------------------------

-- [o]verall app navigation {{{
-- Leader key
vim.g.mapleader = " "

-- reload settings
nmaps("<leader>r", cmd"source $MYVIMRC")

-- save file
nmaps("<leader>s", cmd"up")

-- toggle auto-save
nmap("<leader>S", cmd"AutoSaveToggle")

-- redo
nmap("U", "<C-r>")

-- gf also opens non-existing files
nmaps("gf", cmd"tab split | GF")

-- :nohl
nmaps("<Esc><Esc>", cmd"nohl")

-- control fold
nmaps("zz", "zR")
nmaps("zx", "zM")

-- terminal mode
nmaps("<leader>t", cmd"tab split | terminal")
tmaps("<Esc>", "<C-\\><C-n>")

-- }}} --------------------------------------------------------------

-- [w]orkspace selection {{{

-- launcing app
nmaps("<Leader>o", cmd"FzfLua files")
nmaps("<Leader>g", cmd"FzfLua grep")
-- nmap("<Leader>r", "`Q:NERDTreeClose<CR>:SidebarNvimClose<CR>:AerialClose<CR>")
nmaps("<Leader>r", cmd"NERDTreeClose")
nmaps("<Leader>e", cmd"NERDTreeFocus")

-- window(pane)
nmaps("<Leader>h", cmd"FocusSplitLeft")
nmaps("<Leader>j", cmd"FocusSplitDown")
nmaps("<Leader>k", cmd"FocusSplitUp")
nmaps("<Leader>l", cmd"FocusSplitRight")

nmaps("<Leader>H", ":vs<cr>")
nmaps("<Leader>J", ":sp<cr>:winc j<cr>")
nmaps("<Leader>K", ":sp<cr>")
nmaps("<Leader>L", ":vs<cr>:winc l<cr>")

nmaps("<Leader>w", cmd"q")
nmaps("<Leader><leader>", "<Plug>(Zoom)")

-- buffer(tab.)
nmaps("<Leader>,", cmd"tabp")
nmaps("<Leader>.", cmd"tabn")
-- nmap("ls", cmd"tabs")
nmap("<Leader>q", cmd"tabc")
nmap("<Leader>n", cmd"tabnew")
-- nmap("<Leader>Q", cmd"BufferLinePickClose")

--lazygit
-- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
nmaps("git", cmd"lua _lazygit_toggle()")

-- }}} --------------------------------------------------------------

-- [p]lugin specific keymaps {{{
-- LSP
    -- ~/.config/nvim/lua/plugConfig/lsp-zero.lua

-- return from jump
nmap("gb", cmd"q")

-- open weblinks
vim.g.netrw_nogx = 1
nmap("gx", "<Plug>(openbrowser-smart-search)")
nmap("gx", "<Plug>(openbrowser-smart-search)")

-- change current window size
-- nnoremap <Leader><C-h> :WinResizerStartResize<CR>h<CR>
-- nnoremap <Leader><C-j> :WinResizerStartResize<CR>j<CR>
-- nnoremap <Leader><C-k> :WinResizerStartResize<CR>k<CR>
-- nnoremap <Leader><C-l> :WinResizerStartResize<CR>l<CR>
-- nnoremap <Leader>r :WinResizerStartResize<CR>
-- }}}

-- [m]ode selection {{{
imap("hhh", "<Esc>")
imap("jjj", "<Esc>")
imap("kkk", "<Esc>")
imap("lll", "<Esc>")
vmap("v", "<Esc>")
-- imap jk <Plug>(eskk:enable)
-- cmap jk <Plug>(eskk:enable)
-- tnoremap <Leader>t <C-\><C-n><C-w>k
-- nnoremap <Leader>t <C-w>ji
--keymap("t", "<Esc>", "<C-\><C-n>")
-- }}} --------------------------------------------------------------

-- m[a]cros and marks {{{
-- macro
nmap("~", "q")
nmap("`", "@")
nmap("``", "@@")
nmap("q", "<nop>")
nmap("@", "<nop>")

-- set mark
nmaps("<leader>ms", ":call AutoMarkrement()<CR>")
-- mark auto reg {{{
-- http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908
vim.cmd([[
    if !exists('g:markrement_char')
        let g:markrement_char = [
        \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
        \ ]
    endif
    function! AutoMarkrement()
        if !exists('b:markrement_pos')
            let b:markrement_pos = 0
        else
            let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
        endif
        execute 'mark' g:markrement_char[b:markrement_pos]
        echo 'marked' g:markrement_char[b:markrement_pos]
    endfunction- set mark
]])
-- }}}
nmaps("<leader>mg", "'")
-- delete mark
-- nmaps("dm", ":delmark ")
-- delete mark on current line {{{
vim.cmd([[
    function! Delmarks()
        let l:m = join(filter(
            \ map(range(char2nr('a'), char2nr('z')), 'nr2char(v:val)'),
            \ 'line("''".v:val) == line(".")'))
        if !empty(l:m)
            exe 'delmarks' l:m
        endif
    endfunction
]])
-- }}}
nmaps("<leader>md", ":call Delmarks()<cr>")
-- vim.cmd([[nnoremap <silent> dm :<c-u>call Delmarks()<cr>]])
-- }}} --------------------------------------------------------------

-- [t]ext action {{{
-- Text Selection{{{
vmap("v", "<Plug>(expand_region_expand)")
vmap("V", "<Plug>(expand_region_shrink)")

--select pasted text
nmaps("gp", "'[v']")

-- }}}

-- Text Movement {{{
-- move current line(s)
nmap("<C-j>", ":m .+1<CR>==")
nmap("<C-k>", ":m .-2<CR>==")
-- imap("<C-j>", ":m .+1<CR>==gi")
-- imap("<C-k>", ":m .-2<CR>==gi")
vmap("<C-j>", ":m '>+1<CR>gv=gv")
vmap("<C-k>", ":m '<-2<CR>gv=gv")

-- in/dedent
nmap("<C-h>", "<<")
nmap("<C-l>", ">>")
vmap("<C-h>", "<gv")
vmap("<C-l>", ">gv")

-- EasyAlign prefix
xmap("ga", "<Plug>(EasyAlign)")
nmap("ga", "<Plug>(EasyAlign)")

-- }}}

-- Text Registration(yank){{{
map("Y", "y$")
-- }}}

-- Text Addition {{{
-- paste during insert mode
imap("<C-v>", "<C-o>p")
imap("^V", "<C-o>p")

-- easy insertion of trailing symbols
nmaps(";;", "mqA;<Esc>`q:delmarks q<CR>")
-- nmaps("<C-,>", "mqA,<Esc>`q:delmarks q<CR>")
imaps(";;", "<Esc>A;")
imaps(",,", "<Esc>A,")

-- don't pair
imaps("<C-'>", "'<Esc>lr")
imaps("<C-\">", "\"<Esc>lr")
imaps("<C-`>", "`<Esc>lr")
imaps("<C-(>", "(<Esc>lr")
imaps("<C-{>", "{<Esc>lr")
imaps("<C-[>", "[<Esc>lr")


-- make empty new line
nmap("✠", "o<Esc>hh") -- ✠ = Ctrl+CR (defined in iTerm2 key config)
nmap("۩", "O<Esc>") -- ۩ = Ctrl+Shift+CR
imap("✠", "<Esc>o")
imap("۩", "<Esc>O")
nmap("<C-o>", "o<Esc>")
nmap("<C-S-CR>", "O<Esc>")
imap("<C-o>", "<Esc>o")
imap("<C-S-CR>", "<Esc>O")
-- }}}

-- Text Subtraction{{{
-- C-d to delete
imap("<C-d>", "<Del>")

-- elete char w/o yanking
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })
vim.api.nvim_set_keymap('n', 's', '"_s', { noremap = true })
vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true })
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true })
vim.api.nvim_set_keymap('n', 'dd', '"_dd', { noremap = true })
vim.api.nvim_set_keymap('n', 'D', '"_D', { noremap = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true })

-- cut
nmap("t", "d")
vmap("t", "x")
nmap("tt", "dd")
nmap("T", "D")

-- clear text in current line
nmap("<C-c>", "0D")
imap("<C-c>", "<Esc>0Di")
-- }}}

-- Text Replacement {{{
-- replacing >1 letters
nmap("r", "a<BS>")

-- toggle case of char(s)
nmap("<C-u>", "vg~")
vmap("<C-u>", "g~gv=gv")

-- join w/o indent
vmap("J", "gJ0v^y<cmd>s#<TAB>##g<cr>0Px")
vmap("<C-J>", "J2v^y<cmd>s#<TAB>##g<cr>0Px")

-- commenting
nmaps("<C-_>", "gcc")
vmaps("<C-_>", "gc")
imaps("<C-_>", "<Esc>0v^ygccpr")



-- increment/decrement
nmaps("=", "<Plug>(dial-increment)")
nmaps("+", "<Plug>(dial-increment)")
nmaps("-", "<Plug>(dial-decrement)")

-- }}}
-- }}} --------------------------------------------------------------

-- [c]ursor movement {{{
-- move at the end of pasted text
--keymap("v", "y", "y`]", silent)
--keymap("v", "p", "p`]", silent)
--keymap("n", "p", "p`]", silent)

-- moving up/down - conflict w/ nmap<C-h>
-- map("<expr> j", "(v:count == 0 ? 'gj' : 'j')")
-- map("<expr> k", "(v:count == 0 ? 'gk' : 'k')")

-- edgemotion
-- -- n<Plug>(cosco-commaOrSemicolnmap("<C-j>", "<Plug>(edgemotion-j)")
-- nmap("<C-k>", "<Plug>(edgemotion-k)")

-- move cursor to the beg/end of line
map("<C-a>", "0")
map("<C-e>", "$")

-- jumping to pair of bracket
nmaps("<C-g>", "%")

-- make cursor movable during insert mode with C-hjkl
imap("<C-h>", "<Left>")
imap("<C-j>", "<Down>")
imap("<C-k>", "<Up>")
imap("<C-l>", "<Right>")


-- hop.nvim
nmaps("//", cmd"HopWord")

-- vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
-- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

-- '0' will switch b/w '0' and '^'
-- NOREmap <expr> 0 getline('.')[0 : col('.') - 2] =~# '^\s\+$' ? '0' : '^'

-- }}} --------------------------------------------------------------
