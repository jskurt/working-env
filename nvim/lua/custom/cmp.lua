local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      event = "InsertEnter"
    },
    {
      "hrsh7th/cmp-buffer",
      event = "InsertEnter"
    },
    {
      "hrsh7th/cmp-path",
      event = "InsertEnter"
    }
  }
}
-- 'hrsh7th/cmp-cmdline',

M.config = function()
  local cmp = require("cmp")
  local setup = {
    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" }
    }
  }

  cmp.setup(setup)
end

return M
