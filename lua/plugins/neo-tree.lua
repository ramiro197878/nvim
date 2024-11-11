return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<C-n>", ":Neotree filesystem reveal left<CR>", desc = "NeoTree" },
    { "<leader>bf", ":Neotree buffers reveal float<CR>", desc = "NeoTree" },
  },
  config = function()
    require("neo-tree").setup({
      event_handlers = {

        {
          event = "file_opened",
          handler = function(file_path)
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfile = true,
          hide_gitignored = true,
        },
      },
    })
  end,
}
