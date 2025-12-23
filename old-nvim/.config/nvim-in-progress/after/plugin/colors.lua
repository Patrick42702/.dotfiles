require("rose-pine").setup({
  disable_italics = true,
  highlight_groups = {
    StatusLine = { fg = "love", bg = "love", blend = 10 },
    StatusLineNC = { fg = "subtle", bg = "surface" },
    Comment = { italic = false },
  },
})

require("tokyonight").setup({
  disable_italics = true,
})

require("hubbamax").setup({})

vim.cmd("colorscheme hubbamax")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
