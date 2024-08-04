return {
	-- Themes
	{ "navarasu/onedark.nvim" },
	{ "folke/neodev.nvim" },

	-- Lsp plugins
	{ "neovim/nvim-lspconfig",
        dependencies = {
            {"j-hui/fidget.nvim", opts = {}},
        },
    },
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
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
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
	{ "nvim-telescope/telescope.nvim" },
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
	},

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
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        lazy = false, -- This plugin is already lazy
    },

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
	{ "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			vim.g.codeium_disable_bindings = 1
			vim.g.codeium_manual = false

			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<C-v>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<C-b>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<C-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<C-y>", function()
				return vim.fn["codeium#Complete"]()
			end, { expr = true, silent = true })
		end,
	},
}
