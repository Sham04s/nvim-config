-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("mini.operators").setup({
  replace = {
    prefix = "cr",
  },
  exchange = {
    prefix = "cx",
  },
})

if vim.g.vscode then
  return
end

require("lazyvim").setup({
  -- colorscheme = "onedark",
  colorscheme = "catppuccin",
})

require("notify").setup({
  render = "compact",
  stages = "slide",
  fps = 100,
  max_width = function()
    return math.floor(vim.o.columns * 0.5)
  end,
  max_height = function()
    return math.floor(vim.o.lines * 0.5)
  end,
})

require("neo-tree").setup({
  enable_git_status = true,
  enable_diagnostics = true,
})

require("lspconfig").gdscript.setup({})

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

require("conform").formatters_by_ft = {
  gdscript = { "gdformat" },
}

-- require("lualine").setup({
--   sections = {
--     lualine_c = {
--       LazyVim.lualine.root_dir(),
--       { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
--       { LazyVim.lualine.pretty_path() },
--     },
--   },
-- })
