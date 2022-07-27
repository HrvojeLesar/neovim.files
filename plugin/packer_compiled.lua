-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\Hrvoje\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\Hrvoje\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Hrvoje\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Hrvoje\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\Hrvoje\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\n¶\1\0\0\6\0\v\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\1K\0\1\0\23:DiffviewClose<CR>\t<F4>\22:DiffviewOpen<CR>\t<F3>\6n\bset\vkeymap\bvim\nsetup\rdiffview\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22galaxyline-config\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\galaxyline.nvim",
    url = "https://github.com/NTBBloodbath/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gv.vim",
    url = "https://github.com/junegunn/gv.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16hint_prefix\5\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nU\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\14fast_wrap\1\0\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21nvim-tree-config\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\n¢\2\0\0\b\0\19\0\0316\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\5\0005\5\4\0=\5\6\0045\5\v\0005\6\t\0009\a\a\0019\a\b\a=\a\n\6=\6\f\0055\6\r\0009\a\a\0019\a\b\a=\a\n\6=\6\14\0055\6\15\0009\a\a\0019\a\b\a=\a\n\6=\6\16\5=\5\17\4B\2\2\0019\2\18\0B\2\1\1K\0\1\0\tload\15highlights\21LspReferenceRead\1\0\0\22LspReferenceWrite\1\0\0\21LspReferenceText\1\0\0\abg\1\0\0\bbg1\tdark\16diagnostics\1\0\0\1\0\1\14undercurl\1\nsetup\20onedark.palette\fonedark\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n$\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\15find_files#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\14live_grep!\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\fbuffers#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\14help_tags \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\vresume3\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\30current_buffer_fuzzy_findù\3\1\0\t\0\27\1I6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\a\0005\4\5\0004\5\3\0006\6\0\0'\b\3\0B\6\2\0029\6\4\0064\b\0\0B\6\2\0?\6\0\0=\5\6\4=\4\b\3B\1\2\0019\1\t\0'\3\6\0B\1\2\0016\1\0\0'\3\n\0B\1\2\0026\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\15\0003\6\16\0004\a\0\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\17\0003\6\18\0004\a\0\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\19\0003\6\20\0004\a\0\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\21\0003\6\22\0004\a\0\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\23\0003\6\24\0004\a\0\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\25\0003\6\26\0004\a\0\0B\2\5\0012\0\0€K\0\1\0\0\15<Leader>fi\0\14<Leader>r\0\15<Leader>fh\0\15<Leader>fb\0\15<Leader>fg\0\15<Leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\19load_extension\15extensions\1\0\0\14ui-select\1\0\0\15get_cursor\21telescope.themes\nsetup\14telescope\frequire\3€€À™\4\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  undotree = {
    config = { "\27LJ\2\nU\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\24:UndotreeToggle<CR>\t<F2>\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-prettier"] = {
    config = { "\27LJ\2\nT\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\18:Prettier<CR>\14<Leader>a\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "C:\\Users\\Hrvoje\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-prettier
time([[Config for vim-prettier]], true)
try_loadstring("\27LJ\2\nT\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\18:Prettier<CR>\14<Leader>a\6n\bset\vkeymap\bvim\0", "config", "vim-prettier")
time([[Config for vim-prettier]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n$\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\15find_files#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\14live_grep!\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\fbuffers#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\14help_tags \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\vresume3\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\30current_buffer_fuzzy_findù\3\1\0\t\0\27\1I6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\a\0005\4\5\0004\5\3\0006\6\0\0'\b\3\0B\6\2\0029\6\4\0064\b\0\0B\6\2\0?\6\0\0=\5\6\4=\4\b\3B\1\2\0019\1\t\0'\3\6\0B\1\2\0016\1\0\0'\3\n\0B\1\2\0026\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\15\0003\6\16\0004\a\0\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\17\0003\6\18\0004\a\0\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\19\0003\6\20\0004\a\0\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\21\0003\6\22\0004\a\0\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\23\0003\6\24\0004\a\0\0B\2\5\0016\2\v\0009\2\f\0029\2\r\2'\4\14\0'\5\25\0003\6\26\0004\a\0\0B\2\5\0012\0\0€K\0\1\0\0\15<Leader>fi\0\14<Leader>r\0\15<Leader>fh\0\15<Leader>fb\0\15<Leader>fg\0\15<Leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\19load_extension\15extensions\1\0\0\14ui-select\1\0\0\15get_cursor\21telescope.themes\nsetup\14telescope\frequire\3€€À™\4\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\n¶\1\0\0\6\0\v\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\1K\0\1\0\23:DiffviewClose<CR>\t<F4>\22:DiffviewOpen<CR>\t<F3>\6n\bset\vkeymap\bvim\nsetup\rdiffview\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22galaxyline-config\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nU\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\14fast_wrap\1\0\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\nU\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\24:UndotreeToggle<CR>\t<F2>\6n\bset\vkeymap\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n¢\2\0\0\b\0\19\0\0316\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\5\0005\5\4\0=\5\6\0045\5\v\0005\6\t\0009\a\a\0019\a\b\a=\a\n\6=\6\f\0055\6\r\0009\a\a\0019\a\b\a=\a\n\6=\6\14\0055\6\15\0009\a\a\0019\a\b\a=\a\n\6=\6\16\5=\5\17\4B\2\2\0019\2\18\0B\2\1\1K\0\1\0\tload\15highlights\21LspReferenceRead\1\0\0\22LspReferenceWrite\1\0\0\21LspReferenceText\1\0\0\abg\1\0\0\bbg1\tdark\16diagnostics\1\0\0\1\0\1\14undercurl\1\nsetup\20onedark.palette\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21nvim-tree-config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16hint_prefix\5\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
