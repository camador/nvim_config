require("mason-lspconfig").setup({
  ensure_installed = {
    "docker_compose_language_service",
    "dockerls",
    "html",
    "lua_ls",
    "pyright",
    "solargraph",
    "tsserver",
  },
})
