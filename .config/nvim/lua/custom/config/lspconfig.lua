local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)}
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.ts_ls.setup {
  on_attach = function(client, bufnr)
    -- Disable tsserver's built-in formatting to use Prettier or Eslint
    client.server_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true, -- Disable suggestions (use with a separate completion plugin)
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize imports"
    }
  }
}

lspconfig.eslint.setup {}

lspconfig.pyright.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
--   command = "OrganizeImports"
-- })
--
