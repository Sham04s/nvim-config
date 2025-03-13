-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "wallpaper.glsl", "bloom.glsl", "bubbles.glsl" },
  callback = function()
    local cmd = string.format(
      'adb shell "am broadcast -a de.markusfisch.shadereditor.SAVE_SHADER --es path /data/local/tmp/%s"',
      vim.fn.expand("%:t")
    )
    local out = os.tmpname()

    os.execute(string.format("adb push %s /data/local/tmp > %s", vim.fn.expand("%"), out))
    os.execute(string.format("%s >> %s", cmd, out))

    for line in io.lines(out) do
      print(line)
    end
    os.remove(out)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "glsl",
  command = "set commentstring=//%s",
})

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    os.execute('rm  "C:\\Users\\sneyd\\AppData\\Local\\nvim-data\\shada\\main.shada.tmp.*"')
  end,
})
