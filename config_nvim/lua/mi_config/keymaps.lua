local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = function(mode, shortcut, action, options, desc)
  if desc then
    options["desc"] = desc
  end
  vim.api.nvim_set_keymap(mode, shortcut, action, options)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts, "Cambiar a la ventana izquierda")
keymap("n", "<C-j>", "<C-w>j", opts, "Cambiar a la ventana inferior")
keymap("n", "<C-k>", "<C-w>k", opts, "Cambiar a la ventana superior")
keymap("n", "<C-l>", "<C-w>l", opts, "Cambiar a la ventana derecha")

--keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts, "Aumentar el tamaño horizontal de la ventana")
keymap("n", "<C-Down>", ":resize -2<CR>", opts, "Reducir el tamaño horizontal de la ventana")
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts, "Aumentar el tamaño vertical de la ventana")
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts, "Aumentar el tamaño vertical de la ventana")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts, "Ir al buffer siguiente")
keymap("n", "<S-h>", ":bprevious<CR>", opts, "Ir al buffer anterior")

-- Insert --
-- Press jk fast to enter
--keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts, "Aumentar la indentación y conserva la selección")
keymap("v", ">", ">gv", opts, "Reducir la indentación y conserva la selección")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts, "Mover el texto seleccionado hacia abajo")
keymap("v", "<A-k>", ":m .-2<CR>==", opts, "Mover el texto seleccionado hacia arriba")
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts, "Mover el texto seleccionado hacia abajo")
keymap("x", "K", ":move '<-2<CR>gv-gv", opts, "Mover el texto seleccionado hacia arriba")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts, "Mover el texto seleccionado hacia abajo")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts, "Mover el texto seleccionado hacia arriba")

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts, "Cambiar al terminal izquierdo")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts, "Cambiar al terminal inferior")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts, "Cambiar al terminal superior")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts, "Cambiar al terminal derecho")

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts, "Abrir/cierra el [e]xplorador de ficheros")
keymap("n", "<leader>E", ":NvimTreeFindFile<cr>", opts,"Abrir el [E]xplorador de ficheros y seleccionar el fichero del buffer" )
