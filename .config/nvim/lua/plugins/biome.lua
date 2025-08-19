return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "biome" },
        typescriptreact = { "biome" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
      },
      formatters = {
        biome = {
          command = "npx",
          args = { "@biomejs/biome", "format", "--stdin-file-path", "$FILENAME" },
          stdin = true,
        },
      },
    },
  },
}
