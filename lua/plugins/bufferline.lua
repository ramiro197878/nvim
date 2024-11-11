return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  after = "catppuccin",
  config = function()
    require("bufferline").setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        separator_style = "slant",
        show_close_icon = true,
        show_tab_indicators = true,
        show_buffer_icons = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diagnostics_dict, _)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or "")
            s = s .. n .. sym
          end
          return s
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })
  end,
}
