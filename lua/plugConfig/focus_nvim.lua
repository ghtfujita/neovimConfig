require("focus").setup(
-- {minwidth = 100},
{bufnew = true},
{hybridnumber = true},
{winhighlight = true},
{excluded_filetypes = {"nerdtree"}},

-- By default, the highlight groups are setup as such:
--   hi default link FocusedWindow VertSplit
--   hi default link UnfocusedWindow Normal
-- To change them, you can link them to a different highlight group, see `:h hi-default` for more info.
vim.cmd('hi link UnfocusedWindow CursorLine'),
vim.cmd('hi link FocusedWindow VisualNOS')

)
