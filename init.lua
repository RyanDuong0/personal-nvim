vim.g.mapleader = " "
vim.opt.clipboard = { 'unnamedplus' }
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.termguicolors = true

vim.keymap.set('n', '<leader>mr', function()
    vim.cmd([[%s/\r$//]])
end, { desc = 'Removes leading ^M' })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup("plugins")
require("vim-options")
require("autopairs-config")
require("bufferline").setup{}
require("bufferline-remap")

vim.cmd.colorscheme("catppuccin")



