local lsp_status = require("lsp-status")
lsp_status.config({
    status_symbol = "",
    diagnostics = false,
    current_function = false,
    update_interval = 500,
})
lsp_status.register_progress()

local on_attach = function(client, bufnr)
    local telescope_builtin = require("telescope.builtin")

    if vim.o.filetype == "cs" then
        vim.keymap.set("n", "gd", function()
            require("omnisharp_extended").telescope_lsp_definitions()
        end)
    else
        vim.keymap.set("n", "gd", function()
            telescope_builtin.lsp_definitions()
        end)
    end

    vim.keymap.set("n", "gD", function()
        vim.lsp.buf.declaration()
    end)
    vim.keymap.set("i", "<C-q>", function()
        require("lsp_signature").toggle_float_win()
    end)
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end)
    vim.keymap.set("n", "<C-k>", function()
        vim.lsp.buf.signature_help()
    end)
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
        vim.diagnostic.goto_prev()
    end)
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next()
    end)
    vim.keymap.set("n", "š", function()
        vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
    vim.keymap.set("n", "đ", function()
        vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)
    vim.keymap.set("n", "ć", function()
        vim.diagnostic.goto_prev()
    end)
    vim.keymap.set("n", "ž", function()
        vim.diagnostic.goto_next()
    end)
    vim.keymap.set("n", "<space>q", function()
        telescope_builtin.diagnostics()
    end)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({
            async = true,
            filter = function(format_client)
                if format_client.name == "tsserver" then
                    return false
                end
                return true
            end,
        })
    end)

    -- illuminate lsp config
    require("illuminate").on_attach(client)

    lsp_status.on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local mason_lspconfig = require("mason-lspconfig")

require("rust-tools").setup({
    tools = {
        inlay_hints = {
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = ">> ",
        },
    },
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    },
})

require("neodev").setup({
    library = {
        plugins = {
            { "nvim-dap-ui" },
            types = true,
        },
    },
})

local lsp_config = require("lspconfig")
for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
    if server_name == "lua_ls" then
        lsp_config[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        })
    elseif server_name == "texlab" then
        lsp_config[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                texlab = {
                    build = {
                        executable = "tectonic",
                        args = {
                            "-X",
                            "compile",
                            "%f",
                            "--synctex",
                            "--keep-logs",
                            "--keep-intermediates",
                        },
                    },
                },
            },
        })
    elseif server_name == "omnisharp" then
        lsp_config[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            handlers = {
                ["textDocument/definition"] = require("omnisharp_extended").handler,
            },
        })
    elseif server_name == "phpactor" then
        lsp_config[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            init_options = {
                ["language_server_phpstan.enabled"] = true,
                ["language_server_phpstan.level"] = "9",
                ["language_server_psalm.enabled"] = false,
                ["symfony.enabled"] = true,
                ["language_server_php_cs_fixer.enabled"] = false,
                ["language_server.diagnostics_on_update"] = true,
            },
        })
    elseif server_name == "html" then
        lsp_config[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "html", "twig" },
        })
        -- elseif server_name == "rust_analyzer" then
        --     require("rust-tools").setup({
        --         tools = {
        --             inlay_hints = {
        --                 -- prefix for parameter hints
        --                 parameter_hints_prefix = "<- ",
        --                 -- prefix for all the other hints (type, chaining)
        --                 other_hints_prefix = ">> ",
        --             }
        --         },
        --         server = {
        --             on_attach = on_attach,
        --             capabilities = capabilities,
        --         }
        --     })
    else
        lsp_config[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end
end

local util = require("lspconfig.util")
local configs = require("lspconfig.configs")
configs.twig = {
    default_config = {
        cmd = { "node", "/home/hrvoje/twig-language-server/packages/language-server/out/index.js", "--stdio" },
        filetypes = { "html", "twig" },
        root_dir = util.root_pattern("composer.json", ".git"),
    },
}

lsp_config["twig"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    single_file_support = true,
    settings = {},
    init_options = {
        provideFormatter = true,
        embeddedLanguages = { css = true, javascript = true },
        configurationSection = { "html", "css", "javascript" },
    },
})
