local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup()

require("mason-lspconfig").setup({
  ensure_installed = {"sumneko_lua", "tailwindcss", "rust_analyzer", "pyright", "tsserver"}
})
