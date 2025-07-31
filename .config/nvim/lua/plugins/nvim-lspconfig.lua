return {
  -- change nvim-lspconfig options
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- https://github.com/microsoft/pyright/discussions/5852#discussioncomment-6874502
      pyright = {
        capabilities = {
          textDocument = {
            publishDiagnostics = {
              tagSupport = {
                valueSet = { 2 },
              },
            },
          },
        },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              reportMissingImports = "off",
              reportUndefinedVariable = "off",
            },
          },
        },
        on_attach = function() end,
      },
      ruff_lsp = {},
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              -- Disable overlapping features with pyright/ruff
              pycodestyle = { enabled = false },
              mccabe = { enabled = false },
              pyflakes = { enabled = false },
              flake8 = { enabled = false },
              -- Enable rope for refactoring
              rope_autoimport = { enabled = true },
              rope_completion = { enabled = true },
              rope_rename = { enabled = true },
            }
          }
        }
      }
    },
  },
}
