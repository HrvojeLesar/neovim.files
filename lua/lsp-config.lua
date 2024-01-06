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
    local null_ls_sources = require("null-ls.sources").get_available(vim.bo.filetype, "NULL_LS_FORMATTING")
    local null_ls_formatting_avilable = #null_ls_sources ~= 0

    if vim.o.filetype == "cs" then
        vim.keymap.set("n", "gd", function() require('omnisharp_extended').telescope_lsp_definitions() end)
    else
        vim.keymap.set("n", "gd", function() telescope_builtin.lsp_definitions() end)
    end

    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end)
    vim.keymap.set("i", "<C-q>", function() require("lsp_signature").toggle_float_win() end)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
    vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end)
    vim.keymap.set("n", "<space>wa", function() vim.lsp.buf.add_workspace_folder() end)
    vim.keymap.set("n", "<space>wr", function() vim.lsp.buf.remove_workspace_folder() end)
    vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
    vim.keymap.set("n", "<space>D", function() telescope_builtin.lsp_type_definitions() end)
    vim.keymap.set("n", "<space>rn", function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", "<space>ca", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "gr", function() telescope_builtin.lsp_references() end)
    vim.keymap.set("n", "<space>e", function() vim.diagnostic.open_float() end)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end)
    vim.keymap.set("n", "š", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end)
    vim.keymap.set("n", "đ", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end)
    vim.keymap.set("n", "ć", function() vim.diagnostic.goto_prev() end)
    vim.keymap.set("n", "ž", function() vim.diagnostic.goto_next() end)
    vim.keymap.set("n", "<space>q", function() telescope_builtin.diagnostics() end)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({
            async = true,
            filter = function(format_client)
                if null_ls_formatting_avilable then
                    if format_client.name == "null-ls" then
                        return true
                    else
                        return false
                    end
                else
                    return true
                end
            end
        })
    end)

    -- illuminate lsp config
    require("illuminate").on_attach(client)

    lsp_status.on_attach(client)
end

require("nvim-treesitter.install").compilers = { "clang", "gcc", "cc" }

require("nvim-treesitter.configs").setup {
    highlight = { enable = true },
}

local lspkind = require("lspkind")

local cmp = require("cmp")
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 80,
            mode = "symbol_text",
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            }),
        }),
    },
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require"snippy".expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-k>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- { name = "vsnip" }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = "ultisnips" }, -- For ultisnips users.
        -- { name = "snippy" }, -- For snippy users.
        { name = "vim-dadbod-completion" }, -- SQL dadbod completion
    }, {
        { name = "buffer" },
    })
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local mason_lspconfig = require("mason-lspconfig");

local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("rust-tools").setup({
    tools = {
        inlay_hints = {
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = ">> ",
        }
    },
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
})

local lsp_config = require("lspconfig")
for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
    if server_name == "sumneko_lua" then
        lsp_config[server_name].setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            },
        })
    elseif server_name == "texlab" then
        lsp_config[server_name].setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
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
                            "--keep-intermediates"
                        }
                    }
                }
            },
        })
    elseif server_name == "omnisharp" then
        lsp_config[server_name].setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            handlers = {
                ["textDocument/definition"] = require('omnisharp_extended').handler,
            },
        })
    elseif server_name == "phpactor" then
        lsp_config[server_name].setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            init_options = {
                ["language_server_phpstan.enabled"] = true,
                ["language_server_phpstan.bin"] = os.getenv("HOME") .. "/.config/composer/vendor/phpstan/phpstan/phpstan",
                ["language_server_psalm.enabled"] = false,
                ["language_server_psalm.bin"] = os.getenv("HOME") .. "/.config/composer/vendor/vimeo/psalm/psalm",
                ["symfony.enabled"] = true,
                ["language_server_php_cs_fixer.enabled"] = true,
                ["language_server_php_cs_fixer.bin"] = os.getenv("HOME") ..
                    "/.config/composer/vendor/friendsofphp/php-cs-fixer/php-cs-fixer",
            }
        })
    elseif server_name == "html" then
        lsp_config[server_name].setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            filetypes = { 'html', "twig" },
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
        lsp_config[server_name].setup(opts);
    end
end

local util = require("lspconfig.util")
local configs = require("lspconfig.configs")
configs.twig = {
    default_config = {
        cmd = { "node", "/home/hrvoje/twig-language-server/packages/language-server/out/index.js", "--stdio" },
        filetypes = { 'html', "twig" },
        root_dir = util.root_pattern('composer.json', '.git'),
    }
}

lsp_config["twig"].setup({
    on_attach = opts.on_attach,
    capabilities = opts.capabilities,
    single_file_support = true,
    settings = {},
    init_options = {
        provideFormatter = true,
        embeddedLanguages = { css = true, javascript = true },
        configurationSection = { 'html', 'css', 'javascript' },
    },
})
