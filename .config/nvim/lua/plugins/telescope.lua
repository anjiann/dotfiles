-- Telescope additional configurations to lazyvim
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fh", "<cmd>Telescope harpoon marks<cr>", desc = "Find Harpoon marks" },
  },
  -- This opts table will be merged with the default LazyVim configuration
  opts = {
    defaults = {
      mappings = {
        -- We are in insert mode ('i') in the Telescope prompt
        i = {
          -- Unmap the default <C-a> just to be safe
          ["<C-a>"] = false,
          -- Map "select_all" to a new key, <C-s>
          ["<C-s>"] = require("telescope.actions").select_all,
        },
        -- It's good practice to map it in normal mode too
        n = {
          ["<C-s>"] = require("telescope.actions").select_all,
        },
      },
    },
  },
}
