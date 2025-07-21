return {
  "jake-stewart/multicursor.nvim",
  event = "VeryLazy",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse)
    set("n", "<c-leftdrag>", mc.handleMouseDrag)
    set("n", "<c-leftrelease>", mc.handleMouseRelease)

    -- Disable and enable cursors.
    -- set({ "n", "x" }, "<c-q>", mc.toggleCursor)

    -- Enable cursors
    set({ "n", "v", "x" }, "<leader>m", mc.toggleCursor, { desc = "Enable multicursors" })

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, "<C-left>", mc.prevCursor)
      layerSet({ "n", "x" }, "<C-right>", mc.nextCursor)

      -- Add or skip adding a new cursor by matching word/selection
      layerSet({ "n", "x" }, "n", function()
        mc.matchAddCursor(1)
      end, { desc = "Add cursor at next match" })
      layerSet({ "n", "x" }, "s", function()
        mc.matchSkipCursor(1)
      end, { desc = "Skip cursor to next match" })
      layerSet({ "n", "x" }, "N", function()
        mc.matchAddCursor(-1)
      end, { desc = "Add cursor at previous match" })
      layerSet({ "n", "x" }, "S", function()
        mc.matchSkipCursor(-1)
      end, { desc = "Skip cursor to previous match" })

      local function addCursor(dir)
        return function()
          mc.lineAddCursor(dir)
        end
      end

      local function skipCursor(dir)
        return function()
          mc.lineSkipCursor(dir)
        end
      end

      -- Add or skip cursor above/below the main cursor.
      layerSet({ "n", "x" }, "<c-up>", addCursor(-1), { desc = "Add cursor above" })
      layerSet({ "n", "x" }, "<c-down>", addCursor(1), { desc = "Add cursor below" })
      layerSet({ "n", "x" }, "<s-up>", skipCursor(-1), { desc = "Skip cursor backwards" })
      layerSet({ "n", "x" }, "<s-down>", skipCursor(1), { desc = "Skip cursor forward" })

      layerSet({ "n", "x" }, "<c-k>", addCursor(-1), { desc = "Add cursor above" })
      layerSet({ "n", "x" }, "<c-j>", addCursor(1), { desc = "Add cursor below" })
      layerSet({ "n", "x" }, "<s-k>", skipCursor(-1), { desc = "Skip cursor backwards" })
      layerSet({ "n", "x" }, "<s-j>", skipCursor(1), { desc = "Skip cursor forward" })

      layerSet({ "n", "x" }, "m", mc.matchAllAddCursors, { desc = "Add cursors to all matches" })

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
  end,
}
