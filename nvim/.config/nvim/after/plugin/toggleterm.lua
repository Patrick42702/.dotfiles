local Terminal = require("toggleterm.terminal").Terminal

-- Create a dedicated terminal for lazygit
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  hidden = true,
  on_open = function(term)
    vim.cmd("startinsert!") -- optional: go into insert mode
  end,
})

-- Function to toggle it
function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.keymap.set("n", "<leader>gg", _LAZYGIT_TOGGLE, { noremap = true, silent = true, desc = "Toggle LazyGit" })
