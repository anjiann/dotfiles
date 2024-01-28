return {
  "nvim-pack/nvim-spectre",
  -- build = false,
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  -- stylua: ignore
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").open()

        -- make highlights more readable cse Spectre overwrites the highlight groups set by colorscheme
        vim.api.nvim_set_hl(0, "SpectreSearch", { fg = "NONE", bg = "#ff0f0f" })
        vim.api.nvim_set_hl(0, "SpectreReplace", { fg = "black", bg = "#4bbd5e" })
      end,
      desc = "Replace in files (Spectre)",
    },
  },
}
