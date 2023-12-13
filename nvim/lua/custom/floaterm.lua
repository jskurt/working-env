local M = {
  "voldikss/vim-floaterm"
}

M.config = function()
  vim.cmd [[
    let g:floaterm_autoinsert=1
    let g:floaterm_width=0.9
    let g:floaterm_height=0.9
    let g:floaterm_wintitle=0
    let g:floaterm_autoclose=2
  ]]
end

return M
