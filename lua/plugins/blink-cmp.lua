return {
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.*',

        opts = {
            keymap = {
                preset = 'default',
                ['<CR>'] = { 'accept', 'fallback' },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
            },

            signature = { enabled = true },
            completion = {
                documentation = {
                    auto_show = true,
                },
            },
            cmdline =  {
                enabled = false,
            }
        },
        init = function()
            vim.keymap.set('i', '<C-k>', function()
                require('blink.cmp').show()
                require('blink.cmp').hide()
                require('blink.cmp').show_documentation()
                require('blink.cmp').hide_documentation()
            end, { silent = false });
        end,
        opts_extend = { "sources.default" }
    },
}
