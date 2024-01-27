return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 100000,
  opts = {
    transparent = true,
    style = "storm",
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    -- on_highlights = function(highlights, colors)
    --   highlights.SpectreSearch = {
    --     bg = colors.yellow,
    --     fg = colors.black,
    --   }
    --   highlights.SpectreReplace = {
    --     bg = colors.red,
    --     fg = colors.black,
    --   }
    -- end,
  },
}
