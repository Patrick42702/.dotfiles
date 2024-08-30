require("copilot").setup({
    suggestion = {
        auto_trigger = true,
        keymap = {
            -- change these if you want
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
})

-- vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
--     expr = true,
--     replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true
--
