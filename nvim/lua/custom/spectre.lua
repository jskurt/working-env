local M = {
  "windwp/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

M.config = function()
  local spectre = require('spectre')
  local setup = {
    mapping = {
      ['toggle_line'] = {
        map = "x",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle current item"
      },
      ['run_replace'] = {
        map = "<leader>R",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all"
      }
    }
  }

  spectre.setup(setup)
end

return M
