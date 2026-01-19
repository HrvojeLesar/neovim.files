return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		build = "cargo build --release",

		opts = {
			keymap = {
				["<CR>"] = { "accept", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<C-y>"] = { "select_and_accept" },

				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback_to_mappings" },
				["<C-n>"] = { "select_next", "fallback_to_mappings" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },

				["<C-k>"] = { "show", "hide", "show_documentation", "hide_documentation", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
			},

			signature = { enabled = true },
			completion = {
				documentation = {
					auto_show = true,
				},
			},
			cmdline = {
				enabled = false,
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				-- default = { "lsp", "path", "easy-dotnet", "snippets", "buffer" },
				-- providers = {
				-- 	["easy-dotnet"] = {
				-- 		name = "easy-dotnet",
				-- 		enabled = true,
				-- 		module = "easy-dotnet.completion.blink",
				-- 		score_offset = 10000,
				-- 		async = true,
				-- 	},
				-- },
			},
		},
		opts_extend = { "sources.default" },
	},
}
