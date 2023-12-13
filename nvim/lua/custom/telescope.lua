local M = {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  dependencies = {
    {
      "nvim-lua/plenary.nvim"
    }
  }
}

M.config = function()
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  -- this is a hack to open multiple files in tabs
  -- hopefully this will be fixed in the future
  local function fzf_multi_select(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local num_selections = table.getn(picker:get_multi_selection())

    if num_selections > 1 then
      local _picker = action_state.get_current_picker(prompt_bufnr)
      for _, entry in ipairs(_picker:get_multi_selection()) do
        vim.cmd(string.format("%s %s", ":tabnew!", entry.value))
      end
    else
      actions.select_tab(prompt_bufnr)
    end
  end

  local telescope = require("telescope")
  local setup = {
    defaults = {
      mappings = {
        i = {
          -- I don't care about normal mode
          ["<esc>"] = actions.close,
          ["<C-k>"] = "move_selection_previous",
          ["<C-j>"] = "move_selection_next",
          ['<C-t>'] = fzf_multi_select,
        }
      },
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top"
      }
    }
  }

  telescope.setup(setup)
end

return M
