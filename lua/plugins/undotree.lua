return {
	"mbbill/undotree",
	cmd = "UndotreeToggle", -- lazy-loads only when command is used
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
	},
	config = function()
		-- optional: open undotree on the right
		vim.g.undotree_WindowLayout = 2
	end,
}
