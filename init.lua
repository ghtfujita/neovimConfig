if (vim.g.vscode) then
	require "keymaps"
else
	require "settings"
	require "keymaps"
	require "plugins"
end
