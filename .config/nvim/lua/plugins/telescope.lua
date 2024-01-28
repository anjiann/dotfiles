-- Telescope additional configurations to lazyvim
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fh", "<cmd>Telescope harpoon marks<cr>", desc = "Find Harpoon marks" },
  },
}
