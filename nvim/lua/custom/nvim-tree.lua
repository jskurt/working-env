local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      lazy = true
    }
  }
}

M.config = function()
  local nvim_tree = require("nvim-tree")
  local setup = {
    on_attach = function(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
      vim.keymap.set('n', '<escape>', api.tree.close, opts('Close'))
    end,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    renderer = {
      root_folder_modifier = ":t",
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = false,
    },
    view = {
      float = {
        enable = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local _width = screen_w * 0.9
          local _height = screen_h * 0.9
          local width = math.floor(_width)
          local height = math.floor(_height)
          local center_y = ((vim.opt.lines:get() - _height) / 2) - vim.opt.cmdheight:get()
          local center_x = (screen_w - _width) / 2
          local layouts = {
            center = {
              anchor = 'NW',
              relative = 'editor',
              border = 'single',
              row = center_y,
              col = center_x,
              width = width,
              height = height,
            },
          }

          return layouts.center
        end
      }
    }
  }

  nvim_tree.setup(setup)
end

return M
