local M = {
  "terrortylor/nvim-comment"
}

M.config = function()
  local nvim_comment = require("nvim_comment")

  nvim_comment.setup()
end

return M
