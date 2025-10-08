-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "ruff", "pyright", "ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
  )
end

vim.lsp.config("rust_analyzer", {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

vim.lsp.enable(servers)
vim.lsp.enable("rust_analyzer")

-- configuring single server, example: typescript
-- vim.lsp.config(.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
