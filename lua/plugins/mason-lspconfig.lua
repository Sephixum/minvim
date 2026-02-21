return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {}
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = { "saghen/blink.cmp" },
      config = function()
        local caps = require("blink.cmp").get_lsp_capabilities()
        vim.lsp.config("clangd", {
          capabilities = caps,
        })

        local servers = {
          "clangd",
          "lua_ls"
        }

        for _, server in ipairs(servers) do
          if server == "lua_ls" then
            vim.lsp.config("lua_ls", {
              settings = { Lua = { diagnostics = { globals = { "vim" } } } }
            })
          end

          if server == "clangd" then
            vim.lsp.config("clangd", {
              capabilities = caps,
            })
          end

          vim.lsp.enable(server)
        end
      end
    },
    {
      "saghen/blink.cmp",
      version = "*",
      opts = {
        keymap = { preset = "default" },
        appearance = {
          use_nvim_cmp_as_default = false,
          nerd_font_variant = "mono"
        },
        signature = {
          enabled = true,
        },
        completion = {
          menu = { border = "single" },
          documentation = { window = { border = "single" } },
          ghost_text = { enabled = true },
          list = {
            selection = {
              preselect = false,
              auto_insert = false,
            },
          },
        },
      },
    },
  },
  config = function()
    local settings = {
      ensure_installed = {
        "clangd",
        "lua_ls",
      }
    }
    require("mason-lspconfig").setup(settings)
  end,
}
