return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = "/Users/patrickmuller/workspace/" .. project_name
        local config = {
          cmd = {
            "java", -- or '/path/to/java21_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xmx1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens",
            "java.base/java.util=ALL-UNNAMED",
            "--add-opens",
            "java.base/java.lang=ALL-UNNAMED",

            "-jar",
            "/Users/patrickmuller/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.800.v20240304-1850.jar",
            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
            -- Must point to the                                                     Change this to
            -- eclipse.jdt.ls installation                                           the actual version

            "-configuration",
            "/Users/patrickmuller/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_mac",
            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
            -- Must point to the                      Change to one of `linux`, `win` or `mac`
            -- eclipse.jdt.ls installation            Depending on your system.

            "-data",
            workspace_dir,
          },
          -- This is the default if not provided, you can remove it. Or adjust as needed.
          -- One dedicated LSP server & client will be started per unique root_dir
          root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

          -- Here you can configure eclipse.jdt.ls specific settings
          -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
          -- for a list of options
          settings = {
            java = {},
          },

          -- Language server `initializationOptions`
          -- You need to extend the `bundles` with paths to jar files
          -- if you want to use additional eclipse.jdt.ls plugins.
          --
          -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
          --
          -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
          init_options = {
            bundles = {},
          },
          autostart = true,
        }
        require("jdtls").start_or_attach(config)
      end,
    })
  end,
}
