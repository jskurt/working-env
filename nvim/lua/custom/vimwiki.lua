local M = {
  "vimwiki/vimwiki"
}

M.config = function()
  vim.cmd [[
    let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
  ]]
end

return M
