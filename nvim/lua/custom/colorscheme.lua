local M = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000
}

M.config = function()
  local gruvbox = require("gruvbox")
  local setup = {
    terminal_colors = true,
    transparent_mode = true
  }

  gruvbox.setup(setup)

  vim.cmd([[
    " set the colorscheme and highlight here
    set background=dark
    colorscheme gruvbox

    " make background transparent
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NormalNC guibg=NONE ctermbg=NONE
    highlight NvimTreeNormal guibg=NONE ctermbg=NONE
    highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE
    highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE
    highlight GitSignsCurrentLineBlame guifg=#ffffff
    highlight PmenuSel guibg=gray ctermbg=gray
  ]])
end

return M
