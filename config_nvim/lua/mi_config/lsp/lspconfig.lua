-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        -- Evita el warning 'Undefined global vim' en los ficheros de configuración .lua
        globals = { 'vim' },
      }
    }
  }
}
-- Servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.cssls.setup {
  capabilities = capabilities,
} -- npm install vscode-langservers-extracted
lspconfig.rust_analyzer.setup {}
lspconfig.solargraph.setup {}
lspconfig.tailwindcss.setup {} -- npm install @tailwindcss/language-server
lspconfig.tsserver.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>l', vim.diagnostic.open_float, { desc = '[L]ist current line diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Goto previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Goto next diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Show all diagnostics on location list' })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts, { desc = '[G]oto symbol [D]eclaration' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts, { desc = '[G]oto symbol [d]efinition' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts, { desc = 'Show info for current symbol' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts, { desc = 'Show all [i]mplementations of symbol on Quickfix' })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts, { desc = 'Show signature help' })
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts, { desc = '[W]orkspace: [a]dd folder' })
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts, { desc = '[W]orkspace: [r]emove folder' })
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts, { desc = '[W]orkspace: [l]ist folders' })
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts, { desc = 'Goto to type [D]efinition' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts, { desc = '[R]e[n]ame symbol' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts, { desc = 'Call [c]ode [a]ctions' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts, { desc = 'Show all [r]eferences of symbol on Quickfix' })
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts, { desc = '[F]ormat current buffer code' })
  end,
})

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    border = "rounded",
    source = "always",
  },
}

vim.diagnostic.config(config)
