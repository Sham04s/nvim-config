local opts = {
  flavour = "auto",
  transparent_background = true,
}

if vim.g.neovide then
  opts.transparent_background = false
end

return {}
