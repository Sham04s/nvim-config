return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  cmd = "PrtStatus",
  opts = {},
  config = function()
    require("parrot").setup {
      providers = {
        gemini = {
          api_key = os.getenv("GEMINI_API_KEY")
        },
        -- ollama = {}
      }
    }
  end
}
