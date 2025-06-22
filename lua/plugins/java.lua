return {
  "nvim-java/nvim-java",
  ft = "java",
  vscode = false,
  config = function()
    -- @diagnostic disable-next-line: undefined-field
    if vim.loop.os_uname().sysname == "Windows_NT" then
      require("java").setup({})
      require("lspconfig").jdtls.setup({})
    end

    require("dapui").setup({
      layouts = {
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 10,
        },
        {
          elements = {
            {
              id = "scopes",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "breakpoints",
              size = 0.25,
            },
          },
          position = "left",
          size = 24,
        },
      },
    })
  end,
}
