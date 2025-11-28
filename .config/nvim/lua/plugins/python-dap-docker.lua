return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters.python = {
        type = "server",
        host = "127.0.0.1",
        port = 5678,
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "attach",
          name = "Attach to Docker Django",
          connect = {
            host = "127.0.0.1",
            port = 5678,
          },
          pathMappings = {
            {
              localRoot = vim.fn.getcwd(),
              remoteRoot = "/app",
            },
          },
        },
      }
    end,
  },
}
