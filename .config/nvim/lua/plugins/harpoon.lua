return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false, -- any lazy handler triggers lazy loading. i.e. keymaps
  config = function()
    require("harpoon").setup()
  end,
  opts = {
    -- global_settings = {
    --   save_on_toggle = true,
    --   tabline = true,
    --   tabline_prefix = "   ",
    --   tabline_suffix = "   ",
    -- },
    -- menu = {
    --   width = vim.api.nvim_win_get_width(0) - 10,
    -- },
  },
  keys = {
    -- stylua: ignore start
    { "<leader>hl", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
    { "<leader>ha", function() require("harpoon"):list():append() end, desc = "harpoon: markfile", },
    { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
    { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
    { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
    { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
    { "<leader>h5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
    { "<leader>ht", "<cmd>Telescope harpoon marks<cr>", desc = "Telescope harpoon marks" },
    -- { "<leader>hr", "<cmd>lua require('harpoon.term').sendCommand(1, 'ls -La')<cr>"}
    -- stylua: ignore start
  },
}
