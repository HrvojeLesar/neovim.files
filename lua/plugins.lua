vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Themes
    use {
        "navarasu/onedark.nvim",
        config = function()
            local onedark = require("onedark")
            local palette = require("onedark.palette")
            onedark.setup({
                diagnostics = {
                    undercurl = false
                },
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
    use "williamboman/nvim-lsp-installer"
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
    use "glepnir/lspsaga.nvim"

    -- Tree sitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
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
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_cursor({})
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
        "glepnir/galaxyline.nvim",
        config = function()
            require("galaxyline-config")
        end
    }
    use "nvim-lua/lsp-status.nvim"

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup()
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
    use "RRethy/vim-illuminate"
    use {
        "alvarosevilla95/luatab.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("luatab").setup()
        end
    }

    require("lsp-config")
    require("dap-config")
    require("nvim-tree-config")
end)
