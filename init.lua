vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<leader>pv", vim.cmd.ex, { desc = ":Ex command" })
vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd([[ hi normal guibg=none ctermbg=none ]])
vim.cmd([[ hi normalnc guibg=none ctermbg=none ]])
vim.cmd([[ hi pmenu guibg=none ctermbg=none ]])

vim.opt.termguicolors = true

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "failed to clone lazy.nvim:\n", "errormsg" },
            { out,                            "warningmsg" },
            { "\npress any key to exit..." },
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
require("bufferline").setup({})
require("bufferline-remap")

require("catppuccin").setup({
    transparent_background = true,
})

vim.cmd.colorscheme("catppuccin")
