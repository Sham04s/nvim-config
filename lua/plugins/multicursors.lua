return {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvimtools/hydra.nvim",
  },
  opts = {},
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  keys = {
    {
      mode = { "v", "n" },
      "<Leader>m",
      "<cmd>MCstart<cr>",
      desc = "Create a selection for selected text or word under the cursor",
    },
  },
}

-- return {
--   "brenton-leighton/multiple-cursors.nvim",
--   version = "*", -- Use the latest tagged version
--   opts = {}, -- This causes the plugin setup function to be called
--   keys = {
--     { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
--     { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },
--
--     { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "i", "x" }, desc = "Add cursor and move up" },
--     { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "i", "x" }, desc = "Add cursor and move down" },
--
--     { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },
--
--     { "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x", "v" }, desc = "Add cursors to cword" },
--     {
--       "<Leader>A",
--       "<Cmd>MultipleCursorsAddMatchesV<CR>",
--       mode = { "n", "x" },
--       desc = "Add cursors to cword in previous area",
--     },
--
--     {
--       "<Leader>d",
--       "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
--       mode = { "n", "x" },
--       desc = "Add cursor and jump to next cword",
--     },
--     { "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },
--
--     { "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
--   },
-- }
--

-- return {
--   url = "https://github.com/mg979/vim-visual-multi",
-- }
