return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "tmux pane left pane" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "tmux pane navigate down" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "tmux pane navigate up" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "tmux pane navigate right" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
