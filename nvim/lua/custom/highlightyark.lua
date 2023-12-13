local M = {
  "machakann/vim-highlightedyank"
}

M.config = function()
  vim.cmd [[
    let g:highlightedyank_highlight_duration = 500
  ]]
end

return M
