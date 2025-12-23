-- local lsp_zero = require("lsp-zero")
--
-- lsp_zero.on_attach(function(client, bufnr)
-- 	-- see :help lsp-zero-keybindings
-- 	-- to learn the available actions
-- 	lsp_zero.default_keymaps({ buffer = bufnr })
-- end)

local cmp = require("cmp")

local ELLIPSIS_CHAR = "…"
local MAX_LABEL_WIDTH = 20
local MIN_LABEL_WIDTH = 20

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
  mapping = {
    ["<ENTER>"] = cmp.mapping.confirm({ select = false }),
    ["<C-x>"] = cmp.mapping.abort(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
    ["<TAB>"] = cmp.mapping.select_next_item({ behavior = "select" }),
    ["<C-p>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = "insert" })
      else
        cmp.complete()
      end
    end),
    ["<C-n>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = "insert" })
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      local label = vim_item.abbr
      local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
      if truncated_label ~= label then
        vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
      elseif string.len(label) < MIN_LABEL_WIDTH then
        local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
        vim_item.abbr = label .. padding
      end
      return vim_item
    end,
  },
})

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("mason").setup({})

require("mason-lspconfig").setup()

require("lspconfig").basedpyright.setup({
  -- General server settings
  settings = {
    basedpyright = {
      -- Configuration options for basedpyright
      analysis = {
        diagnosticMode = "openFilesOnly", -- or "workspace" to analyze the entire project
        typeCheckingMode = "standard", -- or "strict" or "standard"
        useLibraryCodeForTypes = true,
        autoSearchPaths = true,
        inlayHints = {
          callArgumentNames = true,
        },
      },
      python = {
        -- venvPath = "/Users/patrickmuller/venv/",
        -- venv = "venv",
      },
    },
    -- You can also specify the python interpreter path
  },
  -- Example of setting a local config file path (useful for monorepos)
  -- on_new_config = function(new_config)
  --     new_config.settings.basedpyright.configFilePath = "${workspaceFolder}/backend/pyproject.toml"
  -- end
})

require("lspconfig").lua_ls.setup({
  settings = {},
})

require("lspconfig").clangd.setup({
  settings = {},
})

require("lspconfig").ts_ls.setup({
  settings = {},
})

require("lspconfig").tailwindcss.setup({
  settings = {},
})

require("lspconfig").ocamllsp.setup({
  settings = {},
})
local util = require("lspconfig.util")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").emmet_ls.setup({
  capabilities = capabilities,
  filetypes = {
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
})

require("lspconfig").jsonls.setup({
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = true,
  },
  root_dir = util.find_git_ancestor,
  single_file_support = true,
  capabilities = capabilities,
})

vim.api.nvim_create_user_command("DisableDiagnostics", function()
  vim.diagnostic.disable(false)
end, {})

vim.api.nvim_create_user_command("EnableDiagnostics", function()
  vim.diagnostic.enable(true)
end, {})
