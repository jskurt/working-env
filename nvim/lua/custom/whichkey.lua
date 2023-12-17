local M = {
  "folke/which-key.nvim"
}

M.config = function()
  local setup = {
    plugins = {
      marks = true,       -- shows a list of your marks on ' and `
      registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true,      -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true,      -- default bindings on <c-w>
        nav = true,          -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = true,            -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded",       -- none, single, double, shadow
      position = "bottom",      -- bottom, top
      margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 50 },                                             -- min and max height of the columns
      width = { min = 20, max = 50 },                                             -- min and max width of the columns
      spacing = 3,                                                                -- spacing between columns
      align = "left",                                                             -- align columns left, center or right
    },
    ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true,                                                             -- show help message on the command line when the popup is visible
    triggers = "auto",                                                            -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
  }

  local normal_mode_opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
  }

  local normal_mode_mappings = {
    [","] = { "<cmd>BookmarkToggle<CR>", "Bookmark Toggle" },
    ["a"] = { "<cmd>BookmarkShowAll<CR>", "Bookmark Show All" },
    ["j"] = { "<cmd>BookmarkNext<CR>", "Bookmark Next" },
    ["k"] = { "<cmd>BookmarkPrev<CR>", "Bookmark Prev" },
    ["x"] = { "<cmd>BookmarkClearAll<CR>", "Bookmark Clear All" },
    ["1"] = { "1gt", "Tab 1" },
    ["2"] = { "2gt", "Tab 2" },
    ["3"] = { "3gt", "Tab 3" },
    ["4"] = { "4gt", "Tab 4" },
    ["5"] = { "5gt", "Tab 5" },
    ["6"] = { "6gt", "Tab 6" },
    ["7"] = { "7gt", "Tab 7" },
    ["8"] = { "8gt", "Tab 8" },
    ["9"] = { "9gt", "Tab 9" },
    ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["q"] = { "<C-w>o:q!<CR>", "Close Buffer" },
    ["Q"] = { "<cmd>q!<CR>", "Quit" },
    ["<CR>"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

    g = {
      name = "Git",
      g = { "<cmd>FloatermNew lazygit<CR>", "Lazygit" },
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
        "Undo Stage Hunk",
      },
      d = {
        "<cmd>Gitsigns diffthis HEAD<CR>",
        "Diff",
      },
    },

    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
      r = { "<cmd>LspRestart<CR>", "Restart Lsp Server" },
    },

    s = {
      name = "Search",
      s = { "<cmd>lua require('spectre').open()<CR>", "Search" },
    },

    t = {
      name = "Test",
      o = { "<cmd>TestNearest<CR>", "Nearest" },
      w = { "<cmd>!tmux split-window -h<CR><cmd>!tmux send-keys 'yarn test:watch <C-r>%' C-m;<CR><cmd>!tmux select-pane -t 0<CR>", "Nearest watch" },
      r = { "<cmd>lua require 'rest-nvim'.run()<CR>", "Run REST-API" },
    },

    T = {
      name = "Terminal",
      f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
      h = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horizontal" },
      v = { "<cmd>ToggleTerm size=80 direction=vertical<CR>", "Vertical" },
    },
  }

  local visual_mode_opts = {
    mode = "v",     -- VISUAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
  }

  local visual_mode_mappings = {
    s = {
      name = "Search",
      s = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search with select word" },
    }
  }

  local which_key = require("which-key")

  which_key.setup(setup)
  which_key.register(normal_mode_mappings, normal_mode_opts)
  which_key.register(visual_mode_mappings, visual_mode_opts)
end

return M
