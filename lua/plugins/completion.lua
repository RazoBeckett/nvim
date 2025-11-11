return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "1.*",

		opts = {
			keymap = { preset = "default" },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			signature = {
				enabled = true,
				window = {
					show_documentation = false,
				},
			},

			completion = {
				list = { selection = {
					auto_insert = false,
				} },
				menu = {
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind", gap = 1 },
						},
					},
				},
				documentation = { auto_show = false },
			},

			sources = {
				default = { "snippets", "lsp", "path", "buffer" },
				per_filetype = {
					sql = { "dadbod", "snippets", "buffer" },
				},
				providers = {
					dadbod = { name = "dadbod", module = "vim_dadbod_completion.blink" },
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
		config = function()
			local blink_cmp = require("blink.cmp")
			blink_cmp.setup()

			local capabilities = blink_cmp.get_lsp_capabilities({
				vim.lsp.protocol.make_client_capabilities(),
			})
			vim.lsp.config("*", {
				capabilities = capabilities,
			})
		end,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		config = true,
	},
	{
		-- "github/copilot.vim",
		--[[ "supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<Tab>",
				},
			})
		end, ]]
	},
}
