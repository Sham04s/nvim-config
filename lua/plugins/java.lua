return {
  "nvim-java/nvim-java",
  ft = { "java" },
  enabled = true,
  vscode = false,
  config = function()
    -- @diagnostic disable-next-line: undefined-field
    require("java").setup({})
    require("lspconfig").jdtls.setup({})
  end,
}
