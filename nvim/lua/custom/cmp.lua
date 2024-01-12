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
    },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter"
    }
  }
}

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
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
  }

  cmp.setup(setup)
end

return M
