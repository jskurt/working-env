local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal mode start --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Fast vertical move
keymap("n", "<C-d>", "30j", opts)
keymap("n", "<C-u>", "30k", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate tab start --
keymap("n", "}", ":+tabmove<CR>", opts)
keymap("n", "{", ":-tabmove<CR>", opts)
-- Navigate tab end --

-- Visual mode start --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Visual mode end --

-- Visual Block mode start --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- Visual Block mode end --

-- Telescope map start --
keymap('n', '<Leader>f', ':Telescope find_files<CR>', opts)
keymap('n', '<Leader>rg', ':Telescope live_grep<CR>', opts)
keymap('v', '<Leader>rg', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', opts)
-- Telescope map end --

vim.cmd [[
  " copy current file path to clipboard
  nnoremap <Leader>cp :let @+ = expand("%")<CR>

  " console log
  nnoremap <Leader>cl :silent put=['console.log(\"<C-r><C-w>\", <C-r><C-w>);']<CR>-2==+
  xnoremap <Leader>cl y:<C-u>silent put=['console.log(\"<C-r>"\", <C-r>");']<CR>-2==+

  " replace
  nnoremap <Leader>rp :%s///g<Left><Left>
  nnoremap <Leader>rc :%s///gc<Left><Left><Left>
  xnoremap <Leader>rp :%s///g<Left><Left>
  xnoremap <Leader>rc :%s///gc<Left><Left><Left>
]]
