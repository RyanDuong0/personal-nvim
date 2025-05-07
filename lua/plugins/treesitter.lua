return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "javascript", "c", "markdown", "java"},
                highlight = { enable = true },  -- (was misspelled as 'higlight' earlier btw)
                indent = { enable = true },
            })
        end,
    },
}
