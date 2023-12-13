local M = {
  "vim-test/vim-test"
}

M.config = function()
  vim.cmd [[
    let g:test#javascript#runner = 'jest'
    let test#strategy = "neovim"
    let test#neovim#term_position = "vert"
  ]]
end

return M
