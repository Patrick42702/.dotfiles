vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", "<CMD>Oil .<CR>")
vim.keymap.set("n", "<leader>pv", function()
  local buf_path = vim.api.nvim_buf_get_name(0)
  if buf_path == "" then
    require("oil").open()
  else
    local dir = vim.fn.fnamemodify(buf_path, ":p:h")
    require("oil").open(dir)
  end
end, { desc = "Open Oil in buffer's directory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-z>", "<ESC>")
vim.keymap.set("v", "<C-z>", "<ESC>")
vim.keymap.set("x", "<C-z>", "<ESC>")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>P", '"+p')
vim.keymap.set("v", "<leader>P", '"+p')

vim.keymap.set("i", "jj", "<ESC>l")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>z", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "ds(", "yibvabp")
