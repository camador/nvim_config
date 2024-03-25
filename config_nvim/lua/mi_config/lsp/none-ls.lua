local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
--local completion = null_ls.builtins.completion
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
--local hover = null_ls.builtins.hover

null_ls.setup({
  debug = false,
  sources = {
    -- Lua
    formatting.stylua, -- https://github.com/JohnnyMorganz/StyLua

    -- Javascript, HTML, CSS/SCSS, Markdown, YAML, JSON...
    -- https://prettier.io/
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),

    -- Python
    formatting.black.with({ extra_args = { "--fast" } }),
    --diagnostics.flake8,

    -- Django
    diagnostics.djlint,
    formatting.djlint,

    -- Ruby
    formatting.rubocop,
    -- diagnostics.rubocop,
    formatting.erb_lint, -- https://github.com/Shopify/erb-lint
    diagnostics.erb_lint, -- https://github.com/Shopify/erb-lint
    formatting.htmlbeautifier, -- https://github.com/threedaymonk/htmlbeautifier

    -- Rust
    -- formatting.rustfmt, -- Deprecated: https://github.com/nvimtools/none-ls.nvim/issues/58

    -- TOML
    -- formatting.dprint, -- Deprecated: https://github.com/nvimtools/none-ls.nvim/issues/58

    -- Integración con Gitsigns 
    code_actions.gitsigns,

    -- Significado de la palabra (en ingléss) en la que se encuentra el cursor (`K`)
    --hover.dictionary,
  },
})
