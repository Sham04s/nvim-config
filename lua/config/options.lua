-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local nu = true
vim.g.snacks_animate = false
vim.g.loaded_man_lua = 1

local is_win = vim.loop.os_uname().sysname == "Windows_NT"
if is_win then
  if nu then
    vim.opt.shell = "nu"
    vim.opt.shellcmdflag = "-c"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
    vim.opt.shellpipe = "| save --append"
    vim.opt.shellredir = ""
  else
    vim.o.shell = "pwsh.exe"
    vim.o.shellcmdflag =
      "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command $PSStyle.OutputRendering = 'PlainText';"
    vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
  end
  vim.opt.makeprg = "mingw32-make"
end

if vim.g.neovide then
  vim.g.neovide_refresh_rate = 100
  if is_win then
    vim.o.guifont = "Liga mononoki"
    -- vim.o.guifont = "Mononoki Nerd Font"
    -- vim.o.guifont = "JetBrains Mono"
  end
  vim.g.neovide_scale_factor = 1
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0.02
  vim.g.neovide_cursor_smooth_blink = true
end
