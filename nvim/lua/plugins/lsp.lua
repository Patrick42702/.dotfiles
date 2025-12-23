-- lsp configuration
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                useLibraryCodeForTypes = true,
                typeCheckingMode = "standard",
                diagnosticMode = "workspace",
                autoSearchPath = true,
                inlayHints = {
                  callArgumentNames = true,
                },
              },
            },
            python = {
              pythonPath = vim.fn.exepath("/Users/patrickmuller/venv/bin/python3"),
            },
          },
        },
      },
    },
  },
}
