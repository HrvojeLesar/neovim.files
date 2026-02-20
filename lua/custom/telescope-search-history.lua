local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")

local M = {}

local picker_name = "Telescope Query History"

local unescape = function(content)
	return content:gsub("^__ESCAPED__'(.*)'$", "%1")
end

local function normalize_picker_name(name)
	return name:lower():gsub("%s+", "_")
end

function M.search_history_picker(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()

	local function get_history()
		local db_path = conf.history.path
		local has_sqlite, sqlite = pcall(require, "sqlite")
		if not has_sqlite then
			print("Could not find sqlite, please install sqlite")
			return {}
		end

		local db = sqlite:open(db_path)

		local results = db:eval("SELECT * FROM history WHERE cwd = ? AND picker != ?", {
			opts.cwd,
			picker_name,
		})

		return results
	end

	pickers
		.new({}, {
			prompt_title = picker_name,
			finder = finders.new_table({
				results = get_history(),
				entry_maker = function(entry)
					local stringified_value = entry.picker .. ": " .. unescape(entry.content)
					return {
						value = entry,
						ordinal = stringified_value,
						display = stringified_value,
					}
				end,
			}),
			previewer = nil,
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)

					local entry = action_state.get_selected_entry()

					local value = unescape(entry.value.content)
					local picker_name = normalize_picker_name(entry.value.picker)

					local picker_opts = {
						default_text = value,
					}

					if builtin[picker_name] then
						builtin[picker_name](picker_opts)
					elseif picker_name == "ripgrep" then
						require("custom.telescope-grep").grep(picker_opts)
					end
				end)
				return true
			end,
		})
		:find()
end

return M
