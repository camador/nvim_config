local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

--
-- Keymaps de invocación de Telescope
--
local builtin = require('telescope.builtin')

-- Búsqueda de ficheros
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [f]ile' }) -- ff - Find files
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind open [b]uffer' }) -- fb - Find buffers
vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = '[F]ind string under [c]ursor' }) -- fc - Find string under cursor or selection
vim.keymap.set('n', '<leader>fh', builtin.search_history, { desc = '[F]ind search [h]istory' }) -- fh - Histórico de búsquedas
vim.keymap.set('n', '<leader>fs', function() -- fs - Find a string
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = '[F]ind [s]tring' })

-- Git
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find Git files' }) -- Ctrl-p - Solo ficheros de Git
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Find [G]it [b]ranches' }) -- gb - Git branches
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Find [G]it [c]ommits' }) -- gc - Git commits
vim.keymap.set('n', '<leader>gst', builtin.git_status, { desc = 'Find [G]it [st]atus' }) -- gst - Git status

-- LSP
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, { desc = '[L]SP [d]iagnostics' }) -- ld - Lista de avisos LSP
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = '[L]SP [r]eferences' }) -- ls - Lista de referencias
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = '[L]SP [s}ymbols' }) -- ls - Lista de símbolos

-- Vim
vim.keymap.set('n', '<leader>vc', builtin.commands, { desc = '[V]iew plugin/user [c]ommands' }) -- vc - Lista de comandos de plugins disponibles
vim.keymap.set('n', '<leader>vh', builtin.command_history, { desc = '[V]iew commands [h]istory' }) -- vh - Histórico de comandos ejecutados
vim.keymap.set('n', '<leader>vk', builtin.keymaps, { desc = '[V]iew [k]eymaps' }) -- vk - Listado de atajos de teclado


local actions = require('telescope.actions')
telescope.setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
