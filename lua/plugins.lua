-- vim:fdm=marker:foldlevel=0
-- PLUGINS ==========================================================
-- preload settings {{{
	vim.cmd('packadd vim-jetpack')
	require('jetpack').startup(function(use) use 'lewis6991/impatient.nvim' end)
	require "impatient"
	-- Install vim-jetpack if it is unavailable.
		vim.cmd([[
			let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
			let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
			if !filereadable(s:jetpackfile)
			  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
			endif
		]])
	-- auto install plugins
		vim.cmd([[
			for name in jetpack#names()
				if !jetpack#tap(name)
					call jetpack#sync()
					break
				endif
			endfor
		]])
-- }}}

-- plugins list {{{
require('jetpack').startup(function(use)
	-- Fundamentals {{{
		use { 'tani/vim-jetpack', opt = 1 }-- bootstrap
		use 'lewis6991/impatient.nvim'
		use '907th/vim-auto-save'
		use 'numToStr/Comment.nvim'
		use 'cohama/lexima.vim'
		use 'tpope/vim-endwise'
		use {'phaazon/hop.nvim', branch = 'v2'}
		use 'machakann/vim-sandwich'
		use 'wellle/targets.vim'
		-- use 'vimwiki/vimwiki'
		use 'nathom/filetype.nvim'
		use 'editorconfig/editorconfig-vim'
	-- }}}

	-- LSP {{{
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
		use 'nvim-treesitter/nvim-treesitter-context' -- function names won't scrolled over
		use 'p00f/nvim-ts-rainbow' -- bracket rainbow
		use 'JoosepAlviste/nvim-ts-context-commentstring' -- hi commentstring
		use 'VonHeikemen/lsp-zero.nvim'
		-- LSP Support
		use 'neovim/nvim-lspconfig'
		use 'williamboman/nvim-lsp-installer'
		-- Autocompletion
		use 'hrsh7th/nvim-cmp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'saadparwaiz1/cmp_luasnip'
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-nvim-lua'
		use 'onsails/lspkind-nvim'
		use 'hrsh7th/cmp-cmdline'
		-- Snippets
		use 'L3MON4D3/LuaSnip'
		use 'rafamadriz/friendly-snippets'
		-- misc
		use 'j-hui/fidget.nvim'
		use 'mattn/emmet-vim'
	-- }}}

	-- text objects {{{
		use 'kana/vim-textobj-user'
		-- general
		use 'Julian/vim-textobj-brace'            -- aj/ij for the closest region between any of () [] or {}
		use 'D4KU/vim-textobj-chainmember'        -- am/im for elements in chained method calls and member accesses
		use 'glts/vim-textobj-comment'            -- ac/ic for a comment
		use 'rhysd/vim-textobj-continuous-line'   -- av/iv for lines continued by \ in C++, sh, and others
		use 'kana/vim-textobj-datetime'           -- ada/ida and others for date and time such as 2013-03-13, 19:51:45, 2013-03-13T19:51:50, and more
		use 'kana/vim-textobj-entire'             -- ae/ie for the entire region of the current buffer
		use 'whatyouhide/vim-textobj-erb'         -- aE/iE for erb tags
		use 'somini/vim-textobj-fold'             -- az/iz for a block of folded lines
		use 'kana/vim-textobj-function'           -- af/if and aF/iF for a function / extensible for any language
		use 'kana/vim-textobj-lastpat'            -- a//i/ for a region matched to the last search pattern
		use 'kana/vim-textobj-line'               -- al/il for the current line
		use 'sgur/vim-textobj-parameter'          -- a,/i, for an argument to a function
		use 'saaguero/vim-textobj-pastedtext'     -- gb for last pasted text
		use 'paulhybryant/vim-textobj-path'       -- ap/ip for next file path (w/o basename), aP/iP for the previous file path (w/o basename)
		use 'beloglazov/vim-textobj-quotes'       -- aq/iq for the closest pairs of quotes of any type
		use 'kana/vim-textobj-syntax'             -- ay/iy for a syntax-highlighted item
		use 'jceb/vim-textobj-uri'                -- au/iu for a URL
		use 'lucapette/vim-textobj-underscore'    -- a_/i_ for a region between _s such as bar in foo_bar_baz
		use 'idbrii/textobj-word-column.vim'      -- ac/ic/aC/iC for columns of text defined by word or WORD
		use 'whatyouhide/vim-textobj-xmlattr'     -- ax/ix for XML/HTML attributes
		-- language specific
		use 'libclang-vim/vim-textobj-clang'      -- For C and C++ blocks, etc.: i;f / a;c
		use 'jasonlong/vim-textobj-css'           -- For CSS, Sass, Less, etc.: ic / ac
		use 'spacewander/vim-textobj-lua'         -- For Lua: a/i for function, al/il for a block, and ac/ic for a condition
		use 'coachshea/vim-textobj-markdown'      -- text objects and movements for markdown and rmarkdown files
		use 'akiyan/vim-textobj-php'              -- For PHP: aP/iP for a range between the PHP delimiters such as <?php and ?>
		use 'tek/vim-textobj-ruby'                -- For Ruby: a/i function, class, and r for a block. an for a Scoped::Name.
		use 'nelstrom/vim-textobj-rubyblock'      -- For Ruby: ar/ir for a block
	-- }}}

	-- sidebar {{{
		-- NERDTree
		use 'preservim/nerdtree'
		use 'Xuyuanp/nerdtree-git-plugin'
		use 'ryanoasis/vim-devicons'
		use 'tiagofumo/vim-nerdtree-syntax-highlight'
		use 'PhilRunninger/nerdtree-visual-selection'
		-- sidebar.nvim
		use 'sidebar-nvim/sidebar.nvim'
		-- nvim-scrollbar
		use 'petertriho/nvim-scrollbar'
	-- }}}

	-- git {{{
		use 'akinsho/toggleterm.nvim'
		use 'airblade/vim-gitgutter'
		use 'dandavison/delta'
	-- }}}

	-- FZF {{{
		use 'ibhagwan/fzf-lua'
	-- }}}

	-- else {{{
		-- library for plugins {{{
			use 'Shougo/context_filetype.vim'
			use 'nvim-lua/plenary.nvim'
		-- }}}
		-- additional functions {{{
			use 'tyru/open-browser.vim'
			use 'tyru/open-browser-github.vim'
		-- }}}
		-- Look n Feel {{{
			use 'bluz71/vim-moonfly-colors'
			use 'rafi/awesome-vim-colorschemes'
			use 'nvim-lualine/lualine.nvim'
			use {'kyazdani42/nvim-web-devicons', opt = true}
			use 'xiyaowong/nvim-transparent'
			use 'lambdalisue/readablefold.vim'
			use 'beauwilliams/focus.nvim'
			use {'RRethy/vim-hexokinase', run = 'make hexokinase'} -- add color tip
			use 'folke/todo-comments.nvim'
			use 'chentoast/marks.nvim'
			use 'severin-lemaignan/vim-minimap'
		-- }}}
		-- text ops {{{
			use 'machakann/vim-highlightedyank'
			use 'alvan/vim-closetag' --?
			use 'tpope/vim-repeat'
			use 'bkad/CamelCaseMotion'
		-- }}}
		-- language specific {{{
			use 'tpope/vim-rails'
			use 'osyo-manga/vim-precious'  -- filetype switcher
			use 'preservim/vim-markdown'
			use 'previm/previm'
			use 'iamcco/markdown-preview.nvim'
		-- }}}
		-- else {{{
			use 'yutkat/wb-only-current-line.nvim'
			-- use 'mopp/vim-operator-convert-case'-- keyap未
			use 'monaqa/dial.nvim'
			-- use 'AckslD/nvim-anywise-reg.lua'????
			-- require "plugConfig.nvim-anywise-reg_lua"
			-- use 'wakatime/vim-wakatime'
			use 'jghauser/mkdir.nvim'
			use 'zsugabubus/crazy8.nvim' -- auto tabstop, shiftwidth, softtabstop, expandtab setting
			use 'lfilho/cosco.vim' -- setting未
			use 'lukas-reineke/indent-blankline.nvim'
			use 'andymass/vim-matchup' -- setting未
			use 'klen/nvim-test' -- 未検証
			-- use {'michaelb/sniprun', run = 'zsh ./install.sh'} -- 未検証
			-- 	require "plugConfig.sniprun"
			use 'ntpeters/vim-better-whitespace'
			use 'stevearc/aerial.nvim' -- 動作不良
			use 'jsborjesson/vim-uppercase-sql'
			use 'terryma/vim-expand-region'
			use 'vim-scripts/ReplaceWithRegister'
			use 'skanehira/translate.vim'
		-- }}}
		-- Local plugins {{{
		require"plugConfig.zoom_pane"
		-- require"plugConfig.lsp_definition_in_new_tab"
	end)
		-- }}}
	-- }}}
-- }}}

-- config files{{{
require "plugConfig.vim-auto-save"
require "plugConfig.Comment_nvim"
require "plugConfig.lexima_vim"
require "plugConfig.hop"
require "plugConfig.lualine"
require "plugConfig.nvim-transparent"
require "plugConfig.sidebar_nvim"
require "plugConfig.nerdtree"
require "plugConfig.nvim-scrollbar"
require "plugConfig.nvim-treesitter"
require "plugConfig.lsp-zero"
require "plugConfig.vim-highlightedyank"
require "plugConfig.todo-comments_nvim"
require "plugConfig.quick-scope"
require "plugConfig.marks_nvim"
require "plugConfig.indent-blankline_nvim"
require "plugConfig.vim-matchup"
require "plugConfig.nvim-test"
require "plugConfig.vim-better-whitespace"
require "plugConfig.aerial_nvim"
require "plugConfig.focus_nvim"
require "plugConfig.dial_nvim"
require "plugConfig.toggleterm_nvim"
-- }}}
