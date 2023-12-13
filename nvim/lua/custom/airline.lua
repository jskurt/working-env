local M = {
  "kafelix496/vim-airline",
  -- not going to use vim dev icons for this. it's not actually helps me
  -- dependencies = {
  --  "ryanoasis/vim-devicons"
  -- }
}

M.config = function()
  vim.cmd [[
    let g:airline#extensions#tabline#enabled = 1
    " let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#tabline#formatter = 'unique_tail_customized'
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#tabline#show_splits = 0
  ]]
end

return M
