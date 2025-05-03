vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', '<leader>mr', function()
    vim.cmd([[%s/\r$//]])
end, { desc = 'Removes leading ^M' })


