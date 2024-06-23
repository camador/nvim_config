local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "契" },
    topdelete = { text = "契" },
    changedelete = { text = "▎" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%D-%M-%Y> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true, desc = 'Next hunk'})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true, desc = 'Previous hunk'})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = '[H]unk [s]tage' })
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = '[H]unk [r]eset' })
    map('n', '<leader>hS', gs.stage_buffer, { desc = '[H]unk [S]tage buffer' })
    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = '[H]unk [u]ndo last stage' })
    map('n', '<leader>hR', gs.reset_buffer, { desc = '[H]unk buffer [R]eset' })
    map('n', '<leader>hp', gs.preview_hunk, { desc = '[H]unk [p]review' })
    map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = '[H]unk [b]lame' })
    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[T]oggle [b]lame' })
    map('n', '<leader>hd', gs.diffthis, { desc = '[H]unk [d]iff index' })
    map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = '[H]unk [d]iff HEAD' })
    map('n', '<leader>td', gs.toggle_deleted, { desc = '[T]oggle [d]eleted lines' })
  end
}
