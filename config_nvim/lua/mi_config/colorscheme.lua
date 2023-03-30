-- Carga de forma segura el esquema de color.
--
-- Si no existe muestra un mensaje de aviso al usuario al inciar Neovim

local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
