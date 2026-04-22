local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local M = {}

local function grep(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()
	opts.no_ignore = opts.no_ignore or false

	local finder = finders.new_async_job({
		command_generator = function(prompt)
			if not prompt or prompt == "" then
				return nil
			end

			local pieces = vim.split(prompt, "  ")
			local args = { "rg" }
			if pieces[1] then
				table.insert(args, "-e")
				table.insert(args, pieces[1])
			end

			if pieces[2] then
				table.insert(args, "-g")
				table.insert(args, pieces[2])
			end

			if opts.no_ignore == true then
				table.insert(args, "--no-ignore")
			end

			return vim.iter({
				args,
				{
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
                    "--glob=!.git",
					"-L",
				},
			})
				:flatten()
				:totable()
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd,
	})

    local title = "ripgrep"
    if opts.no_ignore == true then
        title = title .. " - no ignore"
    end

	pickers
		.new(opts, {
			debounce = 100,
			prompt_title = title,
			finder = finder,
			previewer = conf.grep_previewer(opts),
			sorter = require("telescope.sorters").empty(),
		})
		:find()
end

M.grep = grep

return M
