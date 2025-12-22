table.unpack = table.unpack or unpack

vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "DiagnosticUnnecessary" })

-- inlay hints
vim.lsp.inlay_hint.enable(true)
