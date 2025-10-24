return {
  "folke/flash.nvim",
  opts = {
    modes = {
      treesitter = {
        labels = "abcef",
        jump = { pos = "range", autojump = true },
        search = { incremental = true },
        label = { before = true, after = true, style = "inline" },
        highlight = {
          backdrop = false,
          matches = false,
        },
      },
    },
  },
}
