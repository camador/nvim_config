require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "tsserver", "solargraph", "pyright", "black" },
}
