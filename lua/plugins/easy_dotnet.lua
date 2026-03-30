return {
	{
		"GustavEikaas/easy-dotnet.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			require("easy-dotnet").setup({
				lsp = {
					auto_refresh_codelens = true,
				},
			})
		end,
	},
}
