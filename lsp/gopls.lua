---@type vim.lsp.Config
local settings = {
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				ignoredError = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
	on_attach = function(_, bufnr)
		vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
	end,
}

local cwd = vim.fn.getcwd()
if cwd:match("feedfinder2") then
	settings.settings.gopls.buildFlags = {
		"-tags=integration",
	}
end

return settings
