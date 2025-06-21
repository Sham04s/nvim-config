return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  cmd = "PrtStatus",
  opts = {},
  config = function()
    require("parrot").setup({
      providers = {
        gemini = {
          name = "gemini",
          api_key = os.getenv("GEMINI_API_KEY"),
          endpoint = function(self)
            return "https://generativelanguage.googleapis.com/v1beta/models/"
              .. self._model
              .. ":streamGenerateContent?alt=sse"
          end,
          model_endpoint = function(self)
            return { "https://generativelanguage.googleapis.com/v1beta/models?key=" .. self.api_key }
          end,
          headers = function(self)
            return {
              ["Content-Type"] = "application/json",
              ["x-goog-api-key"] = self.api_key,
            }
          end,
          models = {
            "gemini-2.5-flash-preview-05-20",
            "gemini-1.5-flash-latest",
            "gemini-2.0-flash-lite",
            "gemini-2.0-flash-thinking-exp",
            "gemma-3-27b-it",
          },
        },
        -- ollama = {}
      },
    })
  end,
}
