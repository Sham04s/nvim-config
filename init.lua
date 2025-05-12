-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("mini.operators").setup({
  exchange = {
    prefix = "ge",
  },
})

if vim.g.vscode then
  return
end

require("lazyvim").setup({
  -- colorscheme = "onedark",
  colorscheme = "catppuccin",
})

require("neo-tree").setup({
  enable_git_status = true,
  enable_diagnostics = true,
})

require("lspconfig").gdscript.setup({})

require("conform").formatters_by_ft = {
  gdscript = { "gdformat" },
}

require("dap").adapters.godot = {
  type = "server",
  host = "127.0.0.1",
  port = 6006,
}

-- require("dap").configurations.gdscript = {
--   {
--     type = "godot",
--     request = "launch",
--     name = "Launch",
--     project = "${workspaceFolder}",
--     launch_scene = true,
--   },
-- }

require("dapui").setup(
  {
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = { {
      elements = {
        {
          id = "scopes",
          size = 0.4
        },
        {
          id = "watches",
          size = 0.35
        },
        {
          id = "stacks",
          size = 0.15
        },
        {
          id = "breakpoints",
          size = 0.1
        },
      },
      position = "left",
      size = 30
    }, {
      elements = { {
        id = "repl",
        size = 0.5
      }, {
        id = "console",
        size = 0.5
      } },
      position = "bottom",
      size = 10
    } },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
  }
)
