return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = "0.10.0",
		branch = "master",
		lazy = false,
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
}
