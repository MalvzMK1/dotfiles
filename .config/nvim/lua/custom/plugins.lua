local plugins = {
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.config.formatter"
    end
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function ()
      require "custom.config.lint"
    end
  },
  {
    "williambomen/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "custom.config.lspconfig"
      require "plugins.configs.lspconfig"
    end
  }
}

return plugins
