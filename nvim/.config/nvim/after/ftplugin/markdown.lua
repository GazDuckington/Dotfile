local cycle = { "[ ]", "[-]", "[x]" }
local idx_of = {}
for i, s in ipairs(cycle) do
	idx_of[s] = i
end

local function checkbox(direction)
	return function()
		local line = vim.api.nvim_get_current_line()
		local row, col = unpack(vim.api.nvim_win_get_cursor(0))
		local closest, best
		for _, s in ipairs(cycle) do
			local start = 1
			while true do
				local pos = line:find(vim.pesc(s), start)
				if not pos then
					break
				end
				if pos <= col + 1 and (not best or pos > best) then
					best = pos
					closest = s
				end
				start = pos + 1
			end
		end
		if not closest then
			return
		end
		local i = idx_of[closest]
		if direction == "inc" then
			i = i % 3 + 1
		else
			i = (i - 2) % 3 + 1
		end
		local new = cycle[i]
		vim.api.nvim_buf_set_lines(0, row - 1, row, false, {
			line:sub(1, best - 1) .. new .. line:sub(best + 3),
		})
		vim.api.nvim_win_set_cursor(0, { row, best - 1 })
	end
end

vim.keymap.set("n", "t", checkbox("inc"), { buffer = true })
vim.keymap.set("n", "T", checkbox("dec"), { buffer = true })
