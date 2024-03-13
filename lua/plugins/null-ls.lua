return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.yamlfmt.with({
          filetypes = { "yaml" },
        }),
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "html", "json", "markdown", "vue" },
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.ansiblelint.with({
          filetypes = { "yaml" },
        }),
        null_ls.builtins.diagnostics.pylint,
      },
    })

    vim.keymap.set("n", "<leader>ll", vim.lsp.buf.format, {})
  end,
}
