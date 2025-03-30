return {
  "jake-stewart/multicursor.nvim",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
    set({ "n", "x" }, "<leader><up>", function() mc.lineAddCursor(-1) end, { desc = "Add cursor above" })
    set({ "n", "x" }, "<leader><down>", function() mc.lineAddCursor(1) end, { desc = "Add cursor below" })
    set({ "n", "x" }, "<leader><S-up>", function() mc.lineSkipCursor(-1) end, { desc = "Skip cursor backwards" })
    set({ "n", "x" }, "<leader><S-down>", function() mc.lineSkipCursor(1) end, { desc = "Skip cursor forward" })

    -- Add or skip adding a new cursor by matching word/selection
    set({ "n", "x" }, "<leader>n", function() mc.matchAddCursor(1) end, { desc = "Add cursor at next match" })
    set({ "n", "x" }, "<leader>s", function() mc.matchSkipCursor(1) end, { desc = "Skip cursor to next match" })
    set({ "n", "x" }, "<leader>N", function() mc.matchAddCursor(-1) end, { desc = "Add cursor at previous match" })
    set({ "n", "x" }, "<leader>S", function() mc.matchSkipCursor(-1) end, { desc = "Skip cursor to previous match" })

    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse)
    set("n", "<c-leftdrag>", mc.handleMouseDrag)
    set("n", "<c-leftrelease>", mc.handleMouseRelease)

    -- Disable and enable cursors.
    set({ "n", "x" }, "<c-q>", mc.toggleCursor)

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, "<left>", mc.prevCursor)
      layerSet({ "n", "x" }, "<right>", mc.nextCursor)

      -- Delete the main cursor.
      layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { link = "Cursor" })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end
}
-- return {
--   "smoka7/multicursors.nvim",
--   event = "VeryLazy",
--   dependencies = {
--     "nvimtools/hydra.nvim",
--   },
--   opts = {},
--   cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
--   keys = {
--     {
--       mode = { "v", "n" },
--       "<Leader>m",
--       "<cmd>MCstart<cr>",
--       desc = "Create a selection for selected text or word under the cursor",
--     },
--   },
-- }

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
