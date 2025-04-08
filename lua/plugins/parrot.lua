return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  cmd = "Prt",
  opts = {},
  config = function()
    require("parrot").setup {
      providers = {
        gemini = {
          api_key = os.getenv("GEMINI_API_KEY")
        }
      }
    }
  end
}
