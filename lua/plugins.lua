return {
	-- Themes
	{
		"navarasu/onedark.nvim",
		config = function()
			local onedark = require("onedark")
			local palette = require("onedark.palette")
			local transparent = function()
				if vim.fn.has("win32") == 1 then
					return false
				else
					return true
				end
			end
			onedark.setup({
				diagnostics = {
					undercurl = false,
				},
				transparent = transparent(),
				highlights = {
					LspReferenceText = { bg = palette.dark.bg1 },
					LspReferenceWrite = { bg = palette.dark.bg1 },
					LspReferenceRead = { bg = palette.dark.bg1 },
				},
			})
			onedark.load()
		end,
	},
	{ "folke/neodev.nvim" },

	-- Lsp plugins
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},

	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "onsails/lspkind-nvim" },
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				hint_prefix = "",
			})
		end,
	},
	-- { "glepnir/lspsaga.nvim" },

	-- Tree sitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"rust",
					"javascript",
					"typescript",
					"go",
					"html",
					"css",
					"php",
					"tsx",
					"vimdoc",
					"json",
				},
				indent = {
					enable = true,
				},
				highlight = {
					enable = true,
				},
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },

	-- Parenthesis autocomplete
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				fast_wrap = {},
			})
		end,
	},

	-- Debugger
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup({})
		end,
	},

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<F2>", ":UndotreeToggle<CR>", {})
		end,
	},

	-- Telescope
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_cursor({}),
					},
				},
				defaults = {
					mappings = {
						n = {
							["dq"] = actions.delete_buffer,
						},
					},
				},
			})
			telescope.load_extension("ui-select")
		end,
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },

	-- Snippets
	{ "L3MON4D3/LuaSnip" },

	-- Git
	{ "tpope/vim-fugitive" },
	{ "junegunn/gv.vim" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
		end,
	},

	-- Tree
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { { "kyazdani42/nvim-web-devicons", lazy = true } },
		config = function()
			local function lsp_status()
				return require("lsp-status").status()
			end
			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = "",
					section_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diagnostics" },
					lualine_c = {
						{
							"filetype",
							colored = true,
							icon_only = true,
							icon = {
								align = "right",
							},
							padding = { left = 1, right = 1 },
						},
						{
							"filename",
							padding = { left = 0 },
						},
					},
					lualine_x = { lsp_status },
					lualine_y = { "location" },
					lualine_z = { "progress" },
				},
			})
		end,
	},
	{ "nvim-lua/lsp-status.nvim" },

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "CustomBlanklineIndentChar", { fg = "#31353f" })
			end)

			require("ibl").setup({
				indent = {
					char = "│",
					highlight = "CustomBlanklineIndentChar",
				},
				scope = { enabled = false },
			})
		end,
	},

	-- Rust
	{ "simrat39/rust-tools.nvim" },

	-- Comments
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
	},

	-- Text highlight
	-- Extremly slow for large files (might be because of treesitter)
	{ "RRethy/vim-illuminate" },
	{
		"alvarosevilla95/luatab.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("luatab").setup()
		end,
	},
	{ "Hoffs/omnisharp-extended-lsp.nvim" },

	{
		"kristijanhusak/vim-dadbod-completion",
		ft = { "sql", "mysql", "plsql" },
		dependencies = {
			"tpope/vim-dadbod",
		},
	},

	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			"tpope/vim-dadbod",
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		config = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},

	{ "jrop/mongo.nvim" },
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettierd,
				},
			})
		end,
	},
}
