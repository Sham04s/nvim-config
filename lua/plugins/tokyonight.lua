return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon",
    transparent = true,
    on_colors = function(colors)
      colors.border = colors.blue7
    end,
  },
}
