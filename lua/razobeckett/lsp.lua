vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local bufmap = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
		end
		-- lsp keymaps
		bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		bufmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
		bufmap("n", "gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
		bufmap("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		bufmap("n", "gT", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
		bufmap("n", "gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
		bufmap("n", "gr", vim.lsp.buf.references, "[G]et [R]eferences")
		bufmap("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		-- Using Snacks picker take a look at 'Snacks.picker.lua' file
		bufmap("n", "<leader>D", function()
			Snacks.picker.lsp_type_definitions() -- Snacks
			-- require("telescope.builtin").lsp_type_definitions() -- Telescope
		end, "Type [D]efinition")
		bufmap("n", "<leader>ds", function()
			Snacks.picker.lsp_symbols() -- Snacks
			-- require("telescope.builtin").lsp_document_symbols() -- Telescope
		end, "[D]ocument [S]ymbols")
		bufmap("n", "<leader>ws", function()
			Snacks.picker.lsp_workspace_symbols()
			-- require("telescope.builtin").lsp_dynamic_workspace_symbols() -- Telescope
		end, "[W]orkspace [S]ymbols")
	end,
})

-- Global diagnostics config
vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
	virtual_text = {
		source = "if_many",
		spacing = 2,
	},
})
