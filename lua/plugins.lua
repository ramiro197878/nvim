local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
    return string.format("require(\"config/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

-- actual plugins list
use "wbthomason/packer.nvim"

-- LSP

use {"neovim/nvim-lspconfig", config = get_config("lsp")}
use 'williamboman/nvim-lsp-installer'

use {
    "hrsh7th/nvim-cmp",
    requires = {
        {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-vsnip"},
	{"saadparwaiz1/cmp_luasnip"}, {"L3MON4D3/LuaSnip"},
        {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}}
    },
    config = get_config("cmp")
}
use "rafamadriz/friendly-snippets"



-- Themes Gruvbox y Lualine
use { "ellisonleao/gruvbox.nvim", config = get_config("gruvbox") }
-- Lualine
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = get_config("lualine")
}
-- Bufferline
use {
  'akinsho/bufferline.nvim',
  tag = "*",
  requires = 'kyazdani42/nvim-web-devicons',
  config = get_config("bufferline")
}


-- IDE
use "preservim/nerdtree"
use "christoomey/vim-tmux-navigator"
use "easymotion/vim-easymotion"
use "tpope/vim-surround"
use "yggdroot/indentline"
use {"windwp/nvim-autopairs", config = get_config("autopairs")}
use "tpope/vim-fugitive"
