local null_ls = require("null-ls")
local markdownlint_config_path = vim.fn.stdpath("config") .. "/extra/markdownlint_config.json"
local function sqlfluff_extra_args()
	local root_dir = vim.fs.root(0, ".sqlfluff")
	if root_dir == nil then
		return {}
	end

	return { "--config", root_dir .. "/.sqlfluff" }
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"graphql",
				"handlebars",
			},
		}),
		-- null_ls.builtins.formatting.sql_formatter.with({
		--     extra_args = { "--config", '{"tabWidth": 4, "linesBetweenQueries": 2 }' },
		-- }),
		null_ls.builtins.diagnostics.markdownlint.with({
			extra_args = { "--config", markdownlint_config_path },
		}),
		null_ls.builtins.formatting.markdownlint.with({
			extra_args = { "--config", markdownlint_config_path },
		}),
		null_ls.builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "sqlite", table.unpack(sqlfluff_extra_args()) }, -- change to your dialect
		}),
		null_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "sqlite" }, -- change to your dialect
		}),
	},
})
