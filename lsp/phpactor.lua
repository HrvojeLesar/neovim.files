---@type vim.lsp.Config
return {
	init_options = {
		["language_server_phpstan.enabled"] = true,
		["language_server_phpstan.level"] = "9",
		["language_server_psalm.enabled"] = false,
		["symfony.enabled"] = true,
		["language_server_php_cs_fixer.enabled"] = false,
		["language_server.diagnostics_on_update"] = true,
	},
}
