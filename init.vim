set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set ignorecase
"Capture mouse input from terminal
set mouse=a

if has('win32')
    nmap <C-z> <Nop>
endif

if !exists('g:vscode')

let mapleader=";"
"Stops some dumb keybinds in .sql files
let g:ftplugin_sql_omni_key = '<Leader>sql'

set nu rnu
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set termguicolors
set scrolloff=8
set signcolumn=yes

set completeopt=menu,menuone,noselect

set pumheight=13

call plug#begin('~/.vim/plugged')

"Themes
Plug 'navarasu/onedark.nvim'

"Lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp/'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/lsp_signature.nvim'

"Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Parenthesis autocomplete
Plug 'windwp/nvim-autopairs'

"Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

Plug 'mbbill/undotree'

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Snippets
Plug 'L3MON4D3/LuaSnip'

"Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'

"Tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

"Status line
Plug 'NTBBloodbath/galaxyline.nvim' , {'branch': 'main'}
Plug 'nvim-lua/lsp-status.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

"Rust
Plug 'simrat39/rust-tools.nvim'

"Comments
Plug 'numToStr/Comment.nvim'
Plug 'folke/todo-comments.nvim'

"Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }


call plug#end()

syntax on

lua require("lsp-config")
lua require("dap-config")
lua require("galaxyline-config")
lua require("indent-blankline-config")
lua require("nvim-tree-config")

lua << EOF
require'onedark'.setup({
diagnostics = {
    undercurl = false
}
})
require'onedark'.load()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
})

require'telescope'.setup()
require'lsp_signature'.setup({
hint_prefix = "",
})
require'gitsigns'.setup()
require'diffview'.setup()
require'nvim-autopairs'.setup({
    fast_wrap = {}
})
require'Comment'.setup()
require'todo-comments'.setup()
EOF

nnoremap <F2> :UndotreeToggle<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <Leader>r :NvimTreeRefresh<CR>
nnoremap <Leader>n :NvimTreeFindFile<CR>
nnoremap <F3> :DiffviewOpen<CR>
nnoremap <F4> :DiffviewClose<CR>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <Leader>j :bnext<CR>
nnoremap <Leader>k :bprev<CR>

inoremap <C-c> <esc>

endif

" Move visually selected lines with J, K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
