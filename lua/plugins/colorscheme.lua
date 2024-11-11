return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    integrations = {
      alpha = true,
      neotree = true,
      treesitter = true,
      telescope = {
        enabled = true,
      },
    },
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
