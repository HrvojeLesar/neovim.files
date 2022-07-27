local gl = require('galaxyline')
local colors = require('galaxyline.themes.colors').default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {
    'NvimTree',
    'undotree',
    'diff',
    'dapui_watches',
    'dapui_stacks',
    'dapui_breakpoints',
    'dapui_scopes',
    'dap-repl'
}

gls.left[1] = {
    RainbowRed = {
        provider = function() return '▊' end,
        separator = ' ',
        separator_highlight = { 'NONE', colors.darkblue },
        highlight = { colors.blue, colors.bg }
    },
}

gls.left[2] = {
    ViMode = {
        provider = function()
            local alias = { n = 'NORMAL', i = 'INSERT', c = 'COMMAND', v = 'VISUAL', V = 'VISUAL LINE',
                [''] = 'VISUAL BLOCK', s = 'SELECT', R = 'REPLACE' }
            if (alias[vim.fn.mode()] ~= nil) then
                return alias[vim.fn.mode()] .. ' '
            else
                return vim.fn.mode()
            end
        end,
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.fg, colors.darkblue, 'bold' },
    },
}

gls.left[3] = {
    FileIcon = {
        provider = 'FileIcon',
        -- condition = condition.buffer_not_empty,
        highlight = { require('galaxyline.providers.fileinfo').get_file_icon_color, colors.bg },
    },
}

gls.left[4] = {
    FileName = {
        provider = 'FileName',
        -- condition = condition.buffer_not_empty,
        highlight = { colors.magenta, colors.bg, 'bold' }
    }
}

gls.left[6] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = { colors.red, colors.bg }
    }
}
gls.left[7] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = { colors.yellow, colors.bg },
    }
}

gls.left[8] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = { colors.cyan, colors.bg },
    }
}

gls.left[9] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        separator_highlight = { colors.blue, colors.bg },
    }
}

gls.left[10] = {
    GitIcon = {
        provider = function() return '  ' end,
        condition = condition.check_git_workspace,
        highlight = { colors.violet, colors.bg, 'bold' },
    }
}

gls.left[11] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = { colors.violet, colors.bg, 'bold' },
    }
}

gls.right[1] = {
    LspInfo = {
        provider = function()
            return require('lsp-status').status()
        end,
        separator = '',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.fg, colors.bg },
    },
}

gls.right[2] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = '',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.fg, colors.bg },
    },
}

gls.right[3] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.fg, colors.darkblue, 'bold' },
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
        highlight = { colors.blue, colors.bg, 'bold' }
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        highlight = { colors.fg, colors.bg, 'bold' }
    }
}
