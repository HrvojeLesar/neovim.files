return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
            require("nvim-treesitter").setup({})
            require("nvim-treesitter").install({
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
            })
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
}
