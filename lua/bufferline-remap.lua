-- Cycle through buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Close buffer
vim.keymap.set('n', '<leader>bx', ':bdelete<CR>', { desc = 'Delete buffer' })
