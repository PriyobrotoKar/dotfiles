-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>x', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set({ 'n', 't' }, '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 't' }, '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 't' }, '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 't' }, '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>w', '<cmd>w<cr><esc>', { desc = 'Save File' })
vim.keymap.set('n', '<leader>q', function()
  Snacks.bufdelete()
end, { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>Q', '<cmd>qa<cr><esc>', { desc = 'Save File' })
vim.keymap.set('n', '<leader>kq', function()
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  for _, buffer in ipairs(buffers) do
    vim.api.nvim_buf_delete(buffer.bufnr, { force = true })
  end
end, { desc = 'Close all buffers' })

vim.keymap.set('n', '<c-/>', function()
  Snacks.terminal(nil, { cwd = vim.fn.getcwd() })
end, { desc = 'Terminal (Root Dir)' })
vim.keymap.set('t', '<C-/>', '<cmd>close<cr>', { desc = 'Hide Terminal' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
