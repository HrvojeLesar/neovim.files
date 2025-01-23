local my_lsp_config = require("custom.my_lsp_config")

local config = {
    cmd = { vim.fn.stdpath("data") .. "/mason/packages/jdtls/jdtls" },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}

config.on_attach = my_lsp_config.on_attach
config.capabilities = my_lsp_config.capabilities

require('jdtls').start_or_attach(config)
