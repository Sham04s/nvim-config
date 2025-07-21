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

vim.env.LLDB_USE_NATIVE_PDB_READER = 1

local dap = require("dap")

-- setup a debugger config for zig projects
dap.configurations.zig = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}
