-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Add highlighting for .env.* files
vim.filetype.add({
  extension = {
    conf = "conf",
    env = "dotenv",
  },
  filename = {
    [".env"] = "sh",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
  },
})

-- vim.g.lazyvim_python_ruff = "ruff"
vim.env.ROPE_HOME = vim.fn.expand("~/.cache/rope")
