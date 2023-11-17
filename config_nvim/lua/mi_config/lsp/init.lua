local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local mason_status_ok, _ = pcall(require, "mason")
if not mason_status_ok then
  print "Mason no está instalado."
  return
end

local mason_lspconfig_status_ok, _ = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  print "Mason-lspconfig no está instalado."
  return
end
--
-- IMPORTANTE: No modificar el orden de inicialización de los plugins
require("mi_config.lsp.mason")
require("mi_config.lsp.mason-lspconfig")
require("mi_config.lsp.lspconfig")
require("mi_config.lsp.none-ls")
