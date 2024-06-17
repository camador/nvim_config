require("mason-lspconfig").setup({
  ensure_installed = {
    "docker_compose_language_service",
    "dockerls",
    "dprint",
    "html",
    "jdtls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "solargraph",
    "tsserver",
  },
})
