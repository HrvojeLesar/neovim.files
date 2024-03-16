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
        undercurl = false,
    },
    transparent = transparent(),
    highlights = {
        LspReferenceText = { bg = palette.dark.bg1 },
        LspReferenceWrite = { bg = palette.dark.bg1 },
        LspReferenceRead = { bg = palette.dark.bg1 },
    },
})
onedark.load()
