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
		event = { "BufWritePre", "BufReadPost" },
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					go = { "gofmt", "goimports" },
					astro = { lsp_format = "first" },
					css = { "biome-check", "prettierd", "prettier", stop_after_first = true },
					html = { "prettierd", "prettier", stop_after_first = true },
					javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
					lua = { "stylua" },
					python = {
						"ruff_fix",
						"ruff_format",
						"ruff_organize_imports",
					},
					rust = { "rustfmt", lsp_format = "fallback" },
					typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
					nix = { "alejandra" },
				},
			})
			-- Autoformat on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
			vim.keymap.set("n", "<leader>gf", function()
				require("conform").format({ bufnr = 0, async = true, lsp_format = "fallback" })
			end, { desc = "[G]et [F]ormat" })
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
	{
		"mfussenegger/nvim-lint",
		enabled = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "ruff" },
				typescript = { "biome-lint" },
				typescriptreact = { "biome-lint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
}
