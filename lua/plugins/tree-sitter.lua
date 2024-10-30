return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  main  = "nvim-treesitter.configs",
  auto_install = true,
  opts = {
    ensure_installed = {
      "lua",
      "luadoc",
      "yaml",
      "python",
      "json",
      "gitignore",
      "bash",
      "regex",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
