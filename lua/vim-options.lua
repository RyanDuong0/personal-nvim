vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Runs :Ex" })

vim.keymap.set("n", "<leader>mr", function()
    vim.cmd([[%s/\r$//]])
end, { desc = "Removes leading ^M" })
