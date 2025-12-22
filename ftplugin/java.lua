local config = {
    cmd = { vim.fn.stdpath("data") .. "/mason/packages/jdtls/jdtls" },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    on_init = function(client, _)
        client.server_capabilities.semanticTokensProvider = nil  -- turn off semantic tokens
    end,
}

require('jdtls').start_or_attach(config)
