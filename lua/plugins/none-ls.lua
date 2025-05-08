return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Formatting sources
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.clang_format,

				-- Diagnostics sources
				null_ls.builtins.diagnostics.stylelint,
				require("none-ls.diagnostics.ruff"),
				null_ls.builtins.diagnostics.mypy,

				-- Formatting for stylelint
				null_ls.builtins.formatting.stylelint,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = buffnr })
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
