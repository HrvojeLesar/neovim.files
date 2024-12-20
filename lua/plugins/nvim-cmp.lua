return {
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.*',

        opts = {
            keymap = {
                preset = 'default',
                ['<C-k>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<CR>'] = { 'accept', 'fallback' },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
            },

            signature = { enabled = true },
            completion = {
                documentation = {
                    auto_show = true,
                }
            },
            sources = {
                cmdline = {}
            }
        },
        opts_extend = { "sources.default" }
    },
}
