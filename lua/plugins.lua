require("lazy").setup({
    -- Themes
    {
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
    },

    -- Lsp plugins
    { 
        "neovim/nvim-lspconfig",
        config = function()
            require("lsp-config")
        end
    },
    { 
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    { 
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    },

    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "onsails/lspkind-nvim" },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                hint_prefix = "",
            })
        end
    },
    -- { "glepnir/lspsaga.nvim" },

    -- Tree sitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "rust",
                    "javascript",
                    "typescript",
                    "go",
                },
                indent = {
                    enable = true,
                }
            })
        end,
    },
    { 'nvim-treesitter/nvim-treesitter-context' },

    -- Parenthesis autocomplete
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                fast_wrap = {}
            })
        end
    },

    -- Debugger
    { 
        "mfussenegger/nvim-dap",
        config = function()
            require("dap-config")
        end
    },
    { "rcarriga/nvim-dap-ui" },

    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<F2>", ":UndotreeToggle<CR>", {})
        end
    },

    -- Telescope
    { "nvim-lua/plenary.nvim" },
    {
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
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },

    -- Git
    { "tpope/vim-fugitive" },
    { "junegunn/gv.vim" },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        "sindrets/diffview.nvim",
        config = function()
            require("diffview").setup()
            vim.keymap.set("n", "<F3>", ":DiffviewOpen<CR>", {})
            vim.keymap.set("n", "<F4>", ":DiffviewClose<CR>", {})
        end
    },

    -- Tree
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = {
            "kyazdani42/nvim-web-devicons"
        },
        config = function()
            require("nvim-tree-config")
        end
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { {'kyazdani42/nvim-web-devicons', lazy = true}, },
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
    },
    { "nvim-lua/lsp-status.nvim" },

    {
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
    },

    -- Rust
    { "simrat39/rust-tools.nvim" },

    -- Comments
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup()
        end
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn install"
    },

    -- Formatting
    {
        "prettier/vim-prettier",
        build = "npm install --frozen-lockfile --production",
        config = function()
            vim.keymap.set("n", "<Leader>a", ":Prettier<CR>", {})
        end
    },

    -- Text highlight
    -- Extremly slow for large files (might be because of treesitter)
    { "RRethy/vim-illuminate" },
    {
        "alvarosevilla95/luatab.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("luatab").setup()
        end
    },
    { "Hoffs/omnisharp-extended-lsp.nvim" },

    {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        dependencies = {
            "tpope/vim-dadbod",
        },
    },

    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
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
    },

    { "jrop/mongo.nvim" },
},
{

})
