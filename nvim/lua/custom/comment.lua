local M = {
  "numToStr/Comment.nvim",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring"
    }
  }
}

M.config = function()
  local comment = require("Comment")
  local setup = {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
  }

  comment.setup(setup)
end

return M
