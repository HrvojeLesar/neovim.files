-- Create an autocommand group for LaTeX building
vim.api.nvim_create_augroup("TexBuild", { clear = true })

-- Set up autocommand to run build.sh on saving .tex files
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "TexBuild",
	pattern = "*.tex",
	callback = function()
		-- Run build.sh in the current file's directory
		local cmd = "./build.sh"
		vim.fn.jobstart(cmd, {
			cwd = vim.fn.expand("%:p:h"), -- Run in the directory of the current file
			on_stderr = function(_, data)
				if data then
					vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR)
				end
			end,
		})
	end,
})
