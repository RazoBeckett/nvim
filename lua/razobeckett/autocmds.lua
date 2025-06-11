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

vim.api.nvim_create_user_command("Test", function()
	vim.notify("Hello World", vim.log.levels.INFO, { title = "Test", icon = "🎉" })
end, {})

vim.api.nvim_create_user_command("Gpush", function()
	vim.cmd("Git push")
end, {})

vim.api.nvim_create_user_command("Gpull", function()
	vim.cmd("Git pull")
end, {})
