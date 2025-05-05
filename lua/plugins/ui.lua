return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "dracula"
                },
            })
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- optional but recommended
            "MunifTanjim/nui.nvim",
        },
        lazy = false, -- neo-tree loads immediately at startup
        config = function()
            -- Keymaps specific to Neo-tree
            vim.keymap.set("n", "<C-n>", ":Neotree toggle right<CR>")
            vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the left window" })
            vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the right window" })
        end,
    },
    {
        "tpope/vim-commentary",
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
            }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
}
