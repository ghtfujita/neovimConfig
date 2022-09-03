-- vim:fdm=marker:foldlevel=10
--

local M = {}

local function funcmap(mode, key, cmd, silnt)
	vim.api.nvim_set_keymap(mode, key, cmd, {silent = silnt, noremap = false})
end

function M.map(key, cmd)
	funcmap("", key, cmd, false)
end

function M.maps(key, cmd)
	funcmap("", key, cmd, true)
end

function M.nmap(key, cmd)
	funcmap("n", key, cmd, false)
end

function M.nmaps(key, cmd)
	funcmap("n", key, cmd, true)
end

function M.imap(key, cmd)
funcmap("i", key, cmd, false)
end

function M.imaps(key, cmd)
	funcmap("i", key, cmd, true)
end

function M.vmap(key, cmd)
	funcmap("v", key, cmd, false)
end

function M.vmaps(key, cmd)
	funcmap("v", key, cmd, true)
end

function M.xmap(key, cmd)
	funcmap("x", key, cmd, false)
end

function M.xmaps(key, cmd)
	funcmap("x", key, cmd, true)
end

function M.omap(key, cmd)
	funcmap("o", key, cmd, false)
end

function M.omaps(key, cmd)
	funcmap("o", key, cmd, true)
end

function M.tmap(key, cmd)
	funcmap("t", key, cmd, false)
end

function M.tmaps(key, cmd)
	funcmap("t", key, cmd, true)
end

function M.cmd(command)
	return table.concat({"<cmd>", command, "<CR>"})
end

return M
