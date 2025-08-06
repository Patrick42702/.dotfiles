local actions = require("telescope.actions")
local telescope = require("telescope")
telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git/" },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  mappings = {
    i = {
      ["q"] = actions.close,
    },
    n = {
      ["q"] = actions.close,
    },
  },
})

telescope.setup({
  defaults = {
    mappings = {
      n = { -- normal mode
        ["q"] = actions.close,
      },
    },
  },
})

-- Keymap: <leader>sd to open Telescope in ~/.dotfiles
vim.keymap.set("n", "<leader>sc", function()
  require("telescope.builtin").find_files({
    prompt_title = "Dotfiles",
    cwd = vim.fn.expand("~/.dotfiles"),
    hidden = true,
  })
end, { desc = "Search Dotfiles" })
