-- xresources file auto reload
vim.api.nvim_create_autocmd({ "BufWritePost" }, { pattern = "*Xresources", command = "!xrdb -load %" })

-- make shell scripts executable
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		-- check if the file is executable
		if vim.fn.executable(vim.fn.expand("%:p")) == 0 then
			vim.fn.system("chmod +x " .. vim.fn.expand("%"))
			vim.notify("Script is now executable", vim.log.levels.INFO, { title = "autocmd", icon = "🏃️" })
		end
	end,
})

-- open up telescope at startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local buf_name = vim.api.nvim_buf_get_name(0)
		if not buf_name or buf_name == "" then -- Check for empty or non-existent buffer name
			if not pcall(require("telescope.builtin").git_files) then
				vim.cmd("Telescope find_files")
			end
		end
	end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc" },
	callback = function()
		vim.wo.spell = false
		vim.wo.conceallevel = 0
	end,
})

vim.api.nvim_create_user_command("About", function()
	vim.notify(
		"RazoBeckett's Neovim Config\n- https://github.com/RazoBeckett/nvim",
		vim.log.levels.INFO,
		{ title = "About", icon = "" }
	)
end, {})

vim.api.nvim_create_user_command("Gpush", function()
	vim.cmd("Git push")
end, {})

vim.api.nvim_create_user_command("Gpull", function()
	vim.cmd("Git pull")
end, {})

-- LSP Progress in notification
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
		if not client or type(value) ~= "table" then
			return
		end
		local p = progress[client.id]

		for i = 1, #p + 1 do
			if i == #p + 1 or p[i].token == ev.data.params.token then
				p[i] = {
					token = ev.data.params.token,
					msg = ("[%3d%%] %s%s"):format(
						value.kind == "end" and 100 or value.percentage or 100,
						value.title or "",
						value.message and (" **%s**"):format(value.message) or ""
					),
					done = value.kind == "end",
				}
				break
			end
		end

		local msg = {} ---@type string[]
		progress[client.id] = vim.tbl_filter(function(v)
			return table.insert(msg, v.msg) or not v.done
		end, p)

		local spinner = { " ", " ", " ", " ", " ", " ", " ", " " }
		vim.notify(table.concat(msg, "\n"), "info", {
			id = "lsp_progress",
			title = client.name,
			opts = function(notif)
				notif.icon = #progress[client.id] == 0 and " "
					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})
