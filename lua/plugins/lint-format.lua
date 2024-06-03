return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			local config = require("nvim-treesitter.configs")
			---@diagnostic disable-next-line: missing-fields
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
				ensure_installed = { "c", "python", "javascript", "java", "yaml", "bash" },
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- formatting
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.clang_format,
					-- diagnostics
					null_ls.builtins.diagnostics.phpcs,
					null_ls.builtins.diagnostics.mypy,
					-- null_ls.builtins.diagnostics.stylelint,
				},
			})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "[G]et [F]ormat" })
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				check_ts = true,
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				ts_config = {
					lua = { "string" },
					javascript = { "template_string" },
					java = false,
				},
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
