-- xresources file auto reload
vim.api.nvim_create_autocmd({ "BufWritePost" }, { pattern = "*Xresources", command = "!xrdb -load %" })
-- make shell scripts executable
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		-- check if the file is executable
		if vim.fn.executable(vim.fn.expand("%:p")) == 0 then
			vim.fn.system("chmod +x " .. vim.fn.expand("%"))
			vim.notify("Script is now executable", "info")
		end
	end,
})

-- send <C-p> to open up telescope at startup
vim.cmd("autocmd VimEnter * lua require('telescope.builtin').find_files()")
