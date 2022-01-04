set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch

if !exists('g:vscode')

let mapleader=";"

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
Plug 'Raimondi/delimitMate'

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

call plug#end()

let g:onedark_diagnostics_undercurl = v:false
syntax on
colorscheme onedark

lua require("lsp-config")
lua require("dap-config")
lua require("galaxyline-config")
lua require("indent-blankline-config")

lua << EOF
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
})

require'telescope'.setup({
    pickers = {
        find_files = {
            hidden = true,
        }
    }
})
require'nvim-tree'.setup()
require'lsp_signature'.setup()
require'gitsigns'.setup()
require'diffview'.setup()
EOF

nnoremap <F2> :UndotreeToggle<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <F3> :DiffviewOpen<CR>
nnoremap <F4> :DiffviewClose<CR>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

endif

" Move visually selected lines with J, K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
