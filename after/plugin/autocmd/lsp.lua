local custom_code_actions = require("custom.custom_code_actions")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("custom_lsp_keybinds", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		local telescope_builtin = require("telescope.builtin")

		custom_code_actions.attach_typescript_remove_unused(client)

		vim.keymap.set("n", "gd", function()
			telescope_builtin.lsp_definitions()
		end)

		-- vim.keymap.set("n", "gd", function()
		--     telescope_builtin.lsp_definitions()
		-- end)

		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end)

		-- vim.keymap.set("i", "<C-q>", function()
		--     require("lsp_signature").toggle_float_win()
		-- end)

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end)

		-- vim.keymap.set("n", "<C-k>", function()
		--     vim.lsp.buf.signature_help()
		-- end)

		vim.keymap.set("n", "<space>wa", function()
			vim.lsp.buf.add_workspace_folder()
		end)
		vim.keymap.set("n", "<space>wr", function()
			vim.lsp.buf.remove_workspace_folder()
		end)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end)
		vim.keymap.set("n", "<space>D", function()
			telescope_builtin.lsp_type_definitions()
		end)
		vim.keymap.set("n", "<space>rn", function()
			vim.lsp.buf.rename()
		end)
		vim.keymap.set("n", "<space>ca", function()
			vim.lsp.buf.code_action()
		end)
		vim.keymap.set("n", "gr", function()
			telescope_builtin.lsp_references()
		end)
		vim.keymap.set("n", "<Leader>i", function()
			telescope_builtin.lsp_implementations()
		end)
		vim.keymap.set("n", "<space>e", function()
			vim.diagnostic.open_float()
		end)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1 })
		end)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1 })
		end)
		vim.keymap.set("n", "š", function()
			vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
		end)
		vim.keymap.set("n", "đ", function()
			vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
		end)
		vim.keymap.set("n", "ć", function()
			vim.diagnostic.jump({ count = -1 })
		end)
		vim.keymap.set("n", "ž", function()
			vim.diagnostic.jump({ count = 1 })
		end)
		vim.keymap.set("n", "<space>q", function()
			telescope_builtin.diagnostics()
		end)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({
				async = true,
				filter = function(format_client)
					if format_client.name == "ts_ls" then
						return false
					end
					return true
				end,
			})
		end)

		-- illuminate lsp config
		require("illuminate").on_attach(client)
	end,
})
