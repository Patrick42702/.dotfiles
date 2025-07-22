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
