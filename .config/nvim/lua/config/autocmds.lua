-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- So I can stop wondering my changes aren't working >:(
vim.api.nvim_create_autocmd("FocusLost", { pattern = "*", command = "silent! wa" })

-- This table will act as our LIFO (Last-In, First-Out) undo stack.
-- It's defined at the top level of the module to persist between commands.
local qf_undo_stack = {}

-- Create a group to hold our autocommands
local augroup = vim.api.nvim_create_augroup("MyCustomAugroup", { clear = true })

-- Autocommand for the quickfix window
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "qf", -- The filetype for the quickfix window
  callback = function(args)
    local buffer_nr = args.buf

    -- 1. Map 'dd' to DELETE and SAVE for undo
    vim.keymap.set("n", "dd", function()
      local qf_list = vim.fn.getqflist()
      local current_line = vim.fn.line(".")

      if #qf_list >= current_line and current_line > 0 then
        -- Get the item we are about to remove
        local removed_item = qf_list[current_line]

        -- Save the item and its original position to our undo stack
        table.insert(qf_undo_stack, { item = removed_item, index = current_line })

        -- Now, remove it from the actual list
        table.remove(qf_list, current_line)
        vim.fn.setqflist(qf_list, "r")
        vim.cmd.copen() -- Refresh the window
      end
    end, { buffer = buffer_nr, silent = true, desc = "Remove item from quickfix list" })

    -- 2. Map 'u' to UNDO the deletion
    vim.keymap.set("n", "u", function()
      -- Check if there's anything in our undo stack
      if #qf_undo_stack == 0 then
        vim.notify("Quickfix undo history is empty", vim.log.levels.INFO)
        return
      end

      -- Pop the last action from our undo stack
      local last_action = table.remove(qf_undo_stack)
      local qf_list = vim.fn.getqflist()

      -- Insert the item back into the list at its original index
      table.insert(qf_list, last_action.index, last_action.item)

      vim.fn.setqflist(qf_list, "r")
      vim.cmd.copen() -- Refresh the window

      -- Move the cursor to the line that was just restored
      vim.api.nvim_win_set_cursor(0, { last_action.index, 0 })
    end, { buffer = buffer_nr, silent = true, desc = "Undo quickfix item removal" })
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.jinja", "*.jinja2", "*.html" },
  callback = function()
    vim.bo.filetype = "htmldjango"
  end,
})
