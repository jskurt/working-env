local M = {
  "vimwiki/vimwiki"
}

M.init = function()
  vim.g.vimwiki_folding = ""
  vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } }
  vim.g.vimwiki_ext2syntax = {
    [".md"] = "markdown",
    [".markdown"] = "markdown",
    [".mdown"] = "markdown",
  }
end

return M
