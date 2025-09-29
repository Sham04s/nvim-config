return {
  "kawre/leetcode.nvim",
  enabled= false,
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  cmd = "Leet",
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- configuration goes here
    injector = { ---@type table<lc.lang, lc.inject>
      ["cpp"] = {
        imports = function()
          -- return a different list to omit default imports
          return { "#include <vector>", "using namespace std;" }
        end,
        after = "int main() {}",
      },
    },
  },
}
