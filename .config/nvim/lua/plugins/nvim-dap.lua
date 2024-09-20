return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap"
    },
    opts = {
      handlers = {}
    }
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dt",
        "<cmd> DapToggleBreakpoint <CR>",
        "[D]ap [T]oggle breakpoint"
      },
      {
        "<leader>dr",
        "<cmd> DapContinue <CR>",
        "[D]ap [R]un or continue debugger"
      }
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jbyuki/one-small-step-for-vimkind",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"

      dap.configurations.lua = {
        {
          type = 'nlua',
          request = 'attach',
          name = 'Attach to running neovim instance'
        }
      }

      dap.adapters.nlua = function(callback, config)
        callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
      end
    end
  }
}
