return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
			"folke/snacks.nvim", -- optional
		},
		config = function()
			vim.keymap.set("n", "<leader>nc", "<cmd>NeogitCommit<CR>", { desc = "Open NeogitCommit window" })
			vim.keymap.set("n", "<leader>nl", "<cmd>NeogitLogCurrent<CR>", { desc = "Open NeogitLogCurrent window" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",

		config = function()
			require("gitsigns").setup({
				signs = {
					add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
					change = {
						hl = "GitSignsChange",
						text = "│",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "_",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "‾",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "~",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				},
			})
		end,
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("diffview").setup({
				use_icons = true, -- If you have a nerd font or devicons
				enhanced_diff_hl = true,
				view = {
					merge_tool = {
						layout = "diff3_mixed",
						disable_diagnostics = true,
					},
				},
				file_panel = {
					win_config = {
						position = "left", -- "left", "right", "top", "bottom"
						width = 35,
					},
				},
			})
			local map = vim.keymap.set
			map("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "Open DiffView" })
			map("n", "<leader>dl", "<cmd>DiffviewClose<CR>", { desc = "Close DiffView" })
			map("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { desc = "File history" })
		end,
	},
}
