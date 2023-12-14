local M = {
  "pwntester/octo.nvim"
}

M.config = function()
  local octo = require("octo")
  local setup = {
    enable_builtin = true
  }

  octo.setup(setup)

  vim.cmd([[
    highlight OctoEditable guibg=NONE
  ]])
end

return M
