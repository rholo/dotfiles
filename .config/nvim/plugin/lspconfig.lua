local status, lsp_config = pcall(require, 'lspconfig')
if (not status) then return end

lsp_config.ts_ls.setup {
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript' },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}
lsp_config.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lsp_config.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

