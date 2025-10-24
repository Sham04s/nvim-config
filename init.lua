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

-- require("lazyvim").setup({
--   -- colorscheme = "onedark",
--   colorscheme = "catppuccin",
-- })

-- Set a new keybinding for LSP hover that only calls the LSP function
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
