return {
	"folke/snacks.nvim",
	opts = {
		picker = {},
		explorer = {},
	},
	keys = {
		-- Must ones
		{
			"<C-p>",
			function()
				local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
				local result = handle:read("*a")
				handle:close()

				if result:match("true") then
					Snacks.picker.git_files()
				else
					Snacks.picker.files()
				end
			end,
			desc = "[S]earch Git [F]iles",
		},

		{
			"<leader>/",
			function()
				Snacks.picker.lines()
			end,
			desc = "[S]earch in current buffer",
		},

		{
			"<leader>s/",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "[S]earch [/] in Open Files",
		},

		{
			"<leader>s.",
			function()
				Snacks.picker.grep()
			end,
		},
		-- other

		{
			"<leader>sf",
			function()
				Snacks.picker.files()
			end,
			desc = "[S]earch [F]iles",
		},

		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "[S]earch [H]elp",
		},

		--[[ {
			"<leader>sw",
			function()
			end,
		}, ]]

		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},

		{
			"<leader>sb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "[S]earch [B]uffers",
		},

		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "[S]earch [K]eymaps",
		},

		{
			"<leader>e",
			function()
				Snacks.explorer({
					layout = { layout = { position = "right" } },
				})
			end,
		},
		-- gimme all
		{
			"<leader>ss",
			function()
				Snacks.picker()
			end,
		},
	},
}
