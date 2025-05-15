return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            sources = {
                -- Formatting
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "json",
                        "css",
                        "html",
                    },
                }),
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.stylelint,

                -- Diagnostics
                null_ls.builtins.diagnostics.stylelint,
                require("none-ls.diagnostics.ruff"),
                null_ls.builtins.diagnostics.mypy,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })

        vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({ async = true })
        end, { desc = "LSP Format" })
    end,
}
