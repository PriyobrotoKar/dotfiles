-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- [[ General ]]
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

vim.keymap.set('n', '<leader>w', '<cmd>w<CR><Esc>', { desc = 'Save File' })
vim.keymap.set('n', '<leader>Q', '<cmd>qa<CR><Esc>', { desc = 'Quit All' })

-- [[ Diagnostics ]]
vim.keymap.set('n', '<leader>x', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- [[ Terminal ]]
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<c-/>', function()
  Snacks.terminal(nil, { cwd = vim.fn.getcwd() })
end, { desc = 'Open terminal (root dir)' })

vim.keymap.set('t', '<c-/>', '<cmd>close<CR>', { desc = 'Close terminal' })

-- [[ Window Management ]]
vim.keymap.set('n', '<leader>sh', '<C-W>s', { desc = 'Split window below', remap = true })
vim.keymap.set('n', '<leader>sv', '<C-W>v', { desc = 'Split window right', remap = true })
vim.keymap.set('n', '<leader>sd', '<C-W>c', { desc = 'Close window', remap = true })

-- [[ Window Navigation ]]
vim.keymap.set({ 'n', 't' }, '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Focus left window' })
vim.keymap.set({ 'n', 't' }, '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Focus right window' })
vim.keymap.set({ 'n', 't' }, '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Focus lower window' })
vim.keymap.set({ 'n', 't' }, '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Focus upper window' })

-- [[ Buffer Management ]]
vim.keymap.set('n', '<leader>q', function()
  Snacks.bufdelete()
end, { desc = 'Delete buffer' })

vim.keymap.set('n', '<leader>kq', function()
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  for _, buffer in ipairs(buffers) do
    vim.api.nvim_buf_delete(buffer.bufnr, { force = true })
  end
end, { desc = 'Close all buffers' })

-- [[ Move Lines ]]
vim.keymap.set('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<CR>==", { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<CR>==", { desc = 'Move line up' })

vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<CR>==gi', { desc = 'Move line down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<CR>==gi', { desc = 'Move line up' })

vim.keymap.set('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", { desc = 'Move selection up' })

-- [[ Optional - Disable Arrow Keys (Uncomment if needed) ]]
-- vim.keymap.set('n', '<left>',  '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>',    '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>',  '<cmd>echo "Use j to move!!"<CR>')

-- [[ Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
