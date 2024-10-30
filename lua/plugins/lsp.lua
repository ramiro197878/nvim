return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      local opts = { buffer = bufnr }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    require("mason").setup()
    require("mason-lspconfig").setup({
      -- Install these LSPs automatically
      ensure_installed = {
        "bashls",
        "lua_ls",
        "pyright",
        "ansiblels",
      },
    })

    require("mason-tool-installer").setup({
      -- Install these linters, formatters, debuggers automatically
      ensure_installed = {
        "black",
        "debugpy",
        "flake8",
        "isort",
        "mypy",
        "pylint",
      },
    })

    vim.api.nvim_command("MasonToolsInstall")

    require("neodev").setup()
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          telemetry = { enable = false },
          workspace = { checkThirdParty = false },
        },
      },
    })
    require("lspconfig").ansiblels.setup({
      on_attach = on_attach,
      autostar = true,
      cmd = { "ansible-language-server", "--stdio" },
      filetypes = { "yaml" },
      settings = {
        ansible = {
          ansible = {
            path = "ansible",
          },
          executionEnvironment = {
            enabled = false,
          },
          python = {
            interpreterPath = "python",
          },
          validation = {
            enabled = true,
            lint = {
              enabled = true,
              path = "ansible-lint",
            },
          },
        },
      },
    })
    require("lspconfig").pyright.setup({
      on_attach = on_attach,
      cmd = { "pyright-langserver", "--stdio" },
      capabilities = capabilities,
      autostar = true,
      filetypes = { "python" },
    })
    require("lspconfig").bashls.setup({
      on_attach = on_attach,
      autostar = true,
      filetypes = { "sh" },
    })
  end,
}
