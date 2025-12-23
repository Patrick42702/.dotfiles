require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5 -- set to desired column width
    end
  end,
  open_mapping = [[<c-\>]],
  direction = "float", -- default, can be overridden per terminal
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = false,
})

local Terminal = require("toggleterm.terminal").Terminal

local horizontal_term = Terminal:new({
  direction = "horizontal",
  hidden = true,
})

function _toggle_horizontal_term()
  horizontal_term:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>tv",
  "<cmd>lua _toggle_horizontal_terminal()<CR>",
  { noremap = true, silent = true }
)

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jj", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
