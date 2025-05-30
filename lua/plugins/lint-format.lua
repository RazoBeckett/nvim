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
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					go = { "gofmt", "goimports" },
					astro = { lsp_format = "first" },
					css = { "prettierd", "prettier", stop_after_first = true },
					html = { "prettierd", "prettier", stop_after_first = true },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					lua = { "stylua" },
					python = {
						"ruff_fix",
						"ruff_format",
						"ruff_organize_imports",
					},
					rust = { "rustfmt", lsp_format = "fallback" },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					nix = { "alejandra" },
				},
			})
			vim.keymap.set("n", "<leader>gf", function()
				require("conform").format({ bufnr = 0, async = true, lsp_format = "fallback" })
			end, { desc = "[G]et [F]ormat" })
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		enabled = false,
		config = function()
			local venv_path =
				'import sys; sys.path.append("/usr/lib/python3.11/site-packages"); import pylint_venv; pylint_venv.inithook(force_venv_activation=True, quiet=True)'
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
					-- null_ls.builtins.diagnostics.mypy,
					null_ls.builtins.diagnostics.pylint.with({
						extra_args = { "--init-hook", venv_path },
					}),
					null_ls.builtins.diagnostics.actionlint,
					-- null_ls.builtins.diagnostics.stylelint,
				},
			})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "[G]et [F]ormat" })
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
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
		end,
	},
}
