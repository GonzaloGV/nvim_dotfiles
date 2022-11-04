local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local handlers = require("user.lsp.handlers")
handlers.setup()
require("user.lsp.null-ls")

local sumneko_opts = require("user.lsp.settings.sumneko_lua")
lspconfig.sumneko_lua.setup({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  settings = sumneko_opts,
})

lspconfig.tsserver.setup({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
})

local tailwindcss_opts = require("user.lsp.settings.tailwindcss")
lspconfig.tailwindcss.setup({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  settings = tailwindcss_opts
})

lspconfig.pyright.setup({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
})
lspconfig.rust_analyzer.setup({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
})
