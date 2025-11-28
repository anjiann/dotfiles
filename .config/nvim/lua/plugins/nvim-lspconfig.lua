return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- pyright = {
      --   capabilities = {
      --     textDocument = {
      --       publishDiagnostics = {
      --         tagSupport = {
      --           valueSet = { 2 },
      --         },
      --       },
      --     },
      --   },
      --   settings = {
      --     python = {
      --       analysis = {
      --         typeCheckingMode = "off",
      --         reportMissingImports = "off",
      --         reportUndefinedVariable = "off",
      --       },
      --     },
      --   },
      --   on_attach = function(client, _)
      --     -- disable pyright formatting so only ruff handles it
      --     client.server_capabilities.documentFormattingProvider = false
      --     client.server_capabilities.documentRangeFormattingProvider = false
      --
      --     -- 🚫 disable rename so pylsp handles it instead
      --     client.server_capabilities.renameProvider = false
      --   end,
      -- },
      pyright = false,
      ruff_lsp = {
        on_attach = function(client, _)
          -- ensure ruff does provide formatting
          client.server_capabilities.documentFormattingProvider = true
        end,
      },
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { enabled = false },
              mccabe = { enabled = false },
              pyflakes = { enabled = false },
              flake8 = { enabled = false },
              rope_autoimport = { enabled = true },
              rope_completion = { enabled = true },
              rope_rename = { enabled = true },
            },
          },
        },
        on_attach = function(client, _)
          -- disable pylsp formatting too
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      },
    },
  },
}
