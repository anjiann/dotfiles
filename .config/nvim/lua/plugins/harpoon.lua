return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon"):setup()
  end,
  lazy = false,
  keys = {
    -- { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
    -- { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
    -- { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
    -- { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },

    -- {
    --   "<leader>ha",
    --   function()
    --     require("harpoon"):list():append()
    --   end,
    --   desc = "harpoon: markfile",
    -- },
    -- {
    --   "<leader>ht",
    --   function()
    --     local mark = require("harpoon.mark")
    --     local i = mark.get_current_index()
    --     mark.toggle_file(i)
    --   end,
    --   desc = "harpoon toggle file mark",
    -- },
    -- {
    --   "<leader>hl",
    --   function()
    --     local harpoon = require("harpoon")
    --     harpoon.ui:toggle_quick_menu(harpoon:list())
    --   end,
    --   desc = "harpoon quick menu",
    -- },

    {
      "<leader>h1",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "harpoon: go to file 1",
    },
    {
      "<leader>h2",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "harpoon: go to file 2",
    },
    {
      "<leader>h3",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "harpoon: go to file 3",
    },
    {
      "<leader>h4",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "harpoon: go to file 4",
    },
    {
      "<leader>h5",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "harpoon to file 5",
    },
  },
}
