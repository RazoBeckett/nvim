return {
	"folke/trouble.nvim",
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble: Toggle" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble: Workspace Diagnostics" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble: Document Diagnostics" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble: Quickfix" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble: Loclist" },
		{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Opens todos in trouble" },
	},
}
