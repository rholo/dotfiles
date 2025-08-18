local status, mason = pcall(require, "mason")
if not status then return end

local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status2 then return end

mason.setup({
  --PATH = "skip"  -- o "prepend" si quieres
})

mason_lspconfig.setup({
  automatic_installation = true,
  ensure_installed = {
    "ts_ls",
    "html",
    "cssls",
    "lua_ls"
  }
})
