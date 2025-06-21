-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- insert line into normal mode
map("n", "<leader>o", "o<Esc>")
map("n", "<leader>O", "O<Esc>")

-- Move Lines
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

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
