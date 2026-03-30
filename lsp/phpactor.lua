---@type vim.lsp.Config
return {
	init_options = {
		["language_server_phpstan.enabled"] = true,
		["language_server_phpstan.level"] = "9",
		["language_server_phpstan.bin"] = "%project_root%/dev-tools/vendor/bin/phpstan",
		["language_server_psalm.enabled"] = false,
		["symfony.enabled"] = true,
		["language_server_php_cs_fixer.enabled"] = true,
		["language_server_php_cs_fixer.bin"] = "%project_root%/dev-tools/vendor/bin/php-cs-fixer",
		["language_server.diagnostics_on_update"] = true,
	},
}
