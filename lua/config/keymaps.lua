-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- insert line into normal mode
map("n", "<leader>o", "o<Esc>")
map("n", "<leader>O", "O<Esc>")

-- Move Lines
local MiniMove = require("mini.move")
map({ "n", "i" }, "<M-Down>", function()
  MiniMove.move_line("down")
end, { desc = "Move Down" })
map({ "n", "i", "v" }, "<M-Up>", function()
  MiniMove.move_line("up")
end, { desc = "Move Up" })

map("v", "<A-Down>", function()
  MiniMove.move_selection("down")
end, { desc = "Move Down" })
map("v", "<A-Up>", function()
  MiniMove.move_selection("up")
end, { desc = "Move Up" })

-- Cursor
map("n", "<leader>um", function()
  if vim.o.mouse == "" then
    vim.cmd("set mouse=nvichar")
    vim.notify("Mouse enabled")
  else
    vim.cmd("set mouse=")
    vim.notify("Mouse disabled")
  end
end, { desc = "Toggle mouse" })

-- neovide opacity
if vim.g.neovide then
  local function changeOpacity(value)
    local final = vim.g.neovide_opacity + value
    final = math.max(0, final)
    final = math.min(1, final)
    vim.g.neovide_opacity = final
  end

  local function changeScale(by)
    local newScale = vim.g.neovide_scale_factor + by
    vim.g.neovide_scale_factor = math.max(0.2, math.min(newScale, 2))
  end

  map("n", "<C-S-kPlus>", function()
    changeOpacity(0.05)
  end, { desc = "Increase background opacity" })

  map("n", "<C-S-kMinus>", function()
    changeOpacity(-0.05)
  end, { desc = "Decrease background opacity" })

  map("n", "<F11>", function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  end, { desc = "Toggle fullscreen" })

  map({ "n", "i", "x", "v" }, "<C-kMinus>", function()
    changeScale(-0.1)
  end)
  map({ "n", "i", "x", "v" }, "<C-kPlus>", function()
    changeScale(0.1)
  end)
end

vim.keymap.set("n", "K", function()
  local ok, err = pcall(vim.lsp.buf.hover)
  if not ok then
    print("Hover failed: ", err)
    return
  end
end, { buffer = true, silent = true })
