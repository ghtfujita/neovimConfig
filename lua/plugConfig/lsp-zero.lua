-- LSP
	local lsp = require('lsp-zero')
	lsp.preset('recommended')

	lsp.set_preferences({
		suggest_lsp_servers = true,
		setup_servers_on_start = true,
		set_lsp_keymaps = false,
		configure_diagnostics = true,
		cmp_capabilities = true,
		manage_nvim_cmp = true,
		call_servers = 'local',
		sign_icons = {
			error = '',
			warn = '',
			hint = '',
			info = ''
		}
	})
	lsp.on_attach(function(client, bufnr)
		local cmd = require('utils').cmd
		local map = function(mode, lhs, rhs)
			local opts = {remap = false, buffer = bufnr}
			vim.keymap.set(mode, lhs, rhs, opts)
		end
			-- LSP actions
			map('n', 'K',  cmd'lua vim.lsp.buf.hover()')
			map('n', 'gd', cmd'tab split | lua vim.lsp.buf.definition()')
			map('n', 'gD', cmd'tab split | lua vim.lsp.buf.declaration()')
			map('n', 'gi', cmd'tab split | lua vim.lsp.buf.implementation()')
			map('n', 'go', cmd'tab split | lua vim.lsp.buf.type_definition()')
			map('n', 'gr', cmd'tab split | lua vim.lsp.buf.references()')
			-- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
			map('n', '<F2>', cmd'lua vim.lsp.buf.rename()')
			map('n', '<F4>', cmd'lua vim.lsp.buf.code_action()')
			map('x', '<F4>', cmd'lua vim.lsp.buf.range_code_action()')

			-- Diagnostics
			map('n', 'gl', cmd'lua vim.diagnostic.open_float()')
			map('n', '[d', cmd'lua vim.diagnostic.goto_prev()')
			map('n', ']d', cmd'lua vim.diagnostic.goto_next()')
	end)
	lsp.nvim_workspace()
	lsp.setup()

	vim.diagnostic.config({
		virtual_text = true
	})

-- LSP Servers
	lsp.configure('sumneko_lua', {
		settings = {
			Lua = {
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = {'vim'},
				},
			},
		},
	})

-- nvim-cmp
	local cmp = require('cmp')
	local luasnip = require('luasnip')
	local util = {}
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end
	local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

local cmp_config = {
  completion = {
    completeopt = 'menu,menuone,noselect'
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  window = {
    documentation = vim.tbl_deep_extend(
      'force',
      cmp.config.window.bordered(),
      {
        max_height = 15,
        max_width = 60,
      }
    )
  },
  formatting = {
    fields = {'abbr', 'menu', 'kind'},
    format = function(entry, item)
      local short_name = {
        nvim_lsp = 'LSP',
        nvim_lua = 'nvim'
      }

      local menu_name = short_name[entry.source.name] or entry.source.name

      item.menu = string.format('[%s]', menu_name)
      return item
    end,
  },
  mapping = {
    -- confirm selection
    -- ['<Tab>'] = cmp.mapping.confirm({select = false}),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-l>'] = cmp.mapping.confirm({select = false}),

    -- navigate items on the list
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),

    -- scroll up and down in the completion documentation
    ['<C-f>'] = cmp.mapping.scroll_docs(5),
    ['<C-u>'] = cmp.mapping.scroll_docs(-5),

    -- toggle completion
    ['<C-e>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
        fallback()
      else
        cmp.complete()
      end
    end),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
}
cmp.setup(cmp_config)
cmp.setup.buffer {enabled=false}

require'cmp'.setup.cmdline(':', {
	completion = {
		completeopt = 'menu,menuone,noselect'
	},
	mapping = cmp.mapping.preset.cmdline(),
	view = {
		entries = "wildmenu" -- can be "custom", "wildmenu" or "native"
	},
	sources = {
		{ name = 'cmdline' }
	}
})

require'cmp'.setup.cmdline('/', {
	completion = {
		completeopt = 'menu,menuone,noselect'
	},
	mapping = cmp.mapping.preset.cmdline(),
	view = {
		entries = "wildmenu" -- can be "custom", "wildmenu" or "native"
	},
	entries = "custom", -- can be "custom", "wildmenu" or "native"
	sources = {
		{ name = 'buffer' }
	}
})

-- fidget.nvim
	require"fidget".setup{
		window = {blend = 0}
	}
