local M = {
  "nvimtools/none-ls.nvim"
}

M.config = function()
  local null_ls = require("null-ls")
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics
  local setup = {
    debug = false,
    sources = {
      formatting.prettier,
      formatting.golines,
      formatting.gofumpt,
      formatting.goimports,
      formatting.prismaFmt,
      diagnostics.shellcheck,
    },
  }

  -- https://github.com/prettier-solidity/prettier-plugin-solidity
  -- npm install --save-dev prettier prettier-plugin-solidity
  null_ls.setup(setup)
end

return M
