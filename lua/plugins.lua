return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Themes
    use {
        "navarasu/onedark.nvim",
        config = function()
            local onedark = require("onedark")
            local palette = require("onedark.palette")
            local transparent = function()
                if vim.fn.has("win32") == 1 then
                    return false
                else
                    return true
                end
            end
            onedark.setup({
                diagnostics = {
                    undercurl = false
                },
                transparent = transparent(),
                highlights = {
                    LspReferenceText = { bg = palette.dark.bg1 },
                    LspReferenceWrite = { bg = palette.dark.bg1 },
                    LspReferenceRead = { bg = palette.dark.bg1 },
                }
            })
            onedark.load()
        end,
    }

    -- Lsp plugins
    use "neovim/nvim-lspconfig"
    use { "williamboman/mason.nvim",
        config = function()
            -- require("mason").setup()
        end
    }
    use { "williamboman/mason-lspconfig.nvim",
        config = function()
            -- require("mason-lspconfig").setup()
        end
    }

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "onsails/lspkind-nvim"
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                hint_prefix = "",
            })
        end
    }
    -- use "glepnir/lspsaga.nvim"

    -- Tree sitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
        config = function()
            require("nvim-treesitter.configs").setup({
                indent = {
                    enable = true,
                }
            })
        end,
    }
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Parenthesis autocomplete
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                fast_wrap = {}
            })
        end
    }

    -- Debugger
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"

    use {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<F2>", ":UndotreeToggle<CR>", {})
        end
    }

    -- Telescope
    use "nvim-lua/plenary.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_cursor({})
                    }
                },
                defaults = {
                    mappings = {
                        n = {
                            ["dq"] = actions.delete_buffer
                        },
                    }
                }
            })
            telescope.load_extension("ui-select")

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<Leader>ff", function() builtin.find_files() end, {})
            vim.keymap.set("n", "<Leader>fg", function() builtin.live_grep() end, {})
            vim.keymap.set("n", "<Leader>fb", function() builtin.buffers() end, {})
            vim.keymap.set("n", "<Leader>fh", function() builtin.help_tags() end, {})
            vim.keymap.set("n", "<Leader>r", function() builtin.resume() end, {})
            vim.keymap.set("n", "<Leader>fi", function() builtin.current_buffer_fuzzy_find() end, {})
        end
    }
    use "nvim-telescope/telescope-ui-select.nvim"

    -- Snippets
    use "L3MON4D3/LuaSnip"

    -- Git
    use "tpope/vim-fugitive"
    use "junegunn/gv.vim"
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    }
    use {
        "sindrets/diffview.nvim",
        config = function()
            require("diffview").setup()
            vim.keymap.set("n", "<F3>", ":DiffviewOpen<CR>", {})
            vim.keymap.set("n", "<F4>", ":DiffviewClose<CR>", {})
        end
    }

    -- Tree
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons"
        },
        config = function()
            require("nvim-tree-config")
        end
    }

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            local function lsp_status()
                return require("lsp-status").status()
            end
            require("lualine").setup({
                options = {
                    theme = "auto",
                    component_separators = "",
                    section_separators = "",
                },
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"branch", "diagnostics"},
                    lualine_c = {
                    {
                        "filetype",
                        colored = true,
                        icon_only = true,
                        icon = {
                            align = "right"
                        },
                        padding = { left = 1,  right = 1 }
                    }, 
                    {
                        "filename",
                        padding = { left = 0 }
                    }
                    },
                    lualine_x = { lsp_status },
                    lualine_y = {"location"},
                    lualine_z = {"progress"},
                }
            })
        end
    }
    use "nvim-lua/lsp-status.nvim"

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            local hooks = require "ibl.hooks"
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "CustomBlanklineIndentChar", { fg = "#31353f" })
            end)

            require("ibl").setup({
                indent = { 
                    char = "│",
                    highlight = "CustomBlanklineIndentChar"
                },
                scope = { enabled = false },
            })
        end
    }

    -- Rust
    use "simrat39/rust-tools.nvim"

    -- Comments
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }
    use {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup()
        end
    }

    -- Markdown preview
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install"
    }

    -- Formatting
    use {
        "prettier/vim-prettier",
        run = "npm install --frozen-lockfile --production",
        config = function()
            vim.keymap.set("n", "<Leader>a", ":Prettier<CR>", {})
        end
    }

    -- Text highlight
    -- Extremly slow for large files (might be because of treesitter)
    use "RRethy/vim-illuminate"
    use {
        "alvarosevilla95/luatab.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("luatab").setup()
        end
    }
    use "Hoffs/omnisharp-extended-lsp.nvim"

    use {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        requires = {
            "tpope/vim-dadbod",
        },
    }

    use {
        "kristijanhusak/vim-dadbod-ui",
        requires = {
            "tpope/vim-dadbod",
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        config = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    }

    use {
        "jrop/mongo.nvim"
    }

    require("mason").setup()
    require("mason-lspconfig").setup()
    require("lsp-config")
    require("dap-config")
    require("nvim-tree-config")
end)
