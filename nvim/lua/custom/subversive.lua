local M = {
  "svermeulen/vim-subversive"
}

M.config = function()
  vim.cmd [[
    nmap s <plug>(SubversiveSubstitute)
  ]]
end

return M
