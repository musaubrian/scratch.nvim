local M = {}
local enabled = false

---Creates a new tab with a scratch buffer
---
---@param buf_name string
---@param filetype string
local function createScratchBuff(buf_name, filetype)
	vim.cmd('syntax region ScratchText start="^" end="$"')
	vim.cmd("highlight link ScratchText Normal")
	vim.cmd.tabnew()
	vim.cmd("vertical resize 75")
	vim.cmd("noswapfile hide enew")
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "hide"
	vim.bo.filetype = filetype
	vim.cmd.syntax("enable")
	vim.cmd.file(buf_name)
end

local buf_name = "_scratch"

M.enabled = function(file_type)
	enabled = true
	if enabled then
		local buf_num = vim.fn.bufnr(buf_name)
		if buf_num then
			if vim.api.nvim_buf_is_valid(buf_num) then
				vim.cmd.bdelete(buf_name)
				createScratchBuff(buf_name, file_type)
			else
				createScratchBuff(buf_name, file_type)
			end
		else
			return
		end
	end
end

M.disabled = function()
	enabled = false
	vim.cmd.bdelete(buf_name)
end

M.toggle = function(val, dets)
	if val == nil then
		return M.toggle(not enabled, dets)
	end
	if val then
		M.enabled(dets)
	else
		M.disabled()
	end
end

return M
