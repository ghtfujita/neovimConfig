vim.cmd([[
let g:highlightedyank_highlight_duration = 500
if !exists('##TextYankPost')
	map y <Plug>(highlightedyank)
endif
]])
