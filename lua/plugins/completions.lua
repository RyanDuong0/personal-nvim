return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- Expands snippet using LuaSnip
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),  -- Adds border around the completion window
                    documentation = cmp.config.window.bordered(), -- Adds border around documentation window
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll up documentation
                    ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Scroll down documentation
                    ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion
                    ['<C-e>'] = cmp.mapping.abort(), -- Abort completion
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection from completion
                }),
                sources = cmp.config.sources({
                    { name = 'luasnip' }, -- Use LuaSnip as a completion source
                    { name = 'nvim_lsp' }, -- Use LSP for completion if needed
                    { name = 'buffer' },   -- Use buffer contents for completion
                    { name = 'path' },     -- Use filesystem paths for completion
                    { name = 'cmp_luasnip' }, -- Ensure cmp_luasnip is added if you want snippet support from luasnip
                }, {
                        { name = 'buffer' }, -- Use buffer contents for completion
                    })
            })
        end
    },
}
