return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "latex",
        "tsx",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy", -- or "BufReadPre" for earlier loading
    config = function()
      require("treesitter-context").setup({
        -- Optional configuration, see below for options
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. 0 = infinite
        min_window_height = 0, -- Minimum editor window height to enable context
        line_numbers = true, -- Show line numbers
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        separator = nil, -- Separator between context and content. e.g. "-". Set to nil to disable
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end,
  },
}
