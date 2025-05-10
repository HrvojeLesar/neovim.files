local null_ls = require("null-ls")

local M = {}

function M.attach_typescript_remove_unused(client)
	local action_name = "typescript-remove-unused-custom"
	if client.name == "ts_ls" and not null_ls.is_registered(action_name) then
		null_ls.register({
			name = action_name,
			method = null_ls.methods.CODE_ACTION,
			filetypes = client.config.filetypes,
			generator = {
				fn = function()
					return {
						{
							title = "Remove unused",
							action = function()
								vim.lsp.buf.code_action({
									apply = true,
									context = {
										only = { "source.removeUnused.ts" },
										diagnostics = {},
									},
								})
							end,
						},
					}
				end,
			},
		})
	end
end

return M
