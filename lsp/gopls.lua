---@type vim.lsp.Config
local settings = {
    settings = {
        gopls = {}
    }
}

local cwd = vim.fn.getcwd()
local build_flags = {}

if cwd:match("feedfinder2") then
    build_flags = { "-tags=integration" }
    settings.settings.gopls = {
        buildFlags = build_flags
    }
end

return settings
