local M = {}
local enabled = false

---Creates a new vertical split with a scratch buffer
---
---@param buf_name string
---@param file_type string
local function createScratchBuff(buf_name, file_type)
    vim.cmd('syntax region ScratchText start="^" end="$"')
    vim.cmd('highlight link ScratchText Normal')
    vim.cmd.set('splitright')
    vim.cmd.vsplit()
    vim.cmd('vertical resize 65')
    vim.cmd('noswapfile hide enew')
    vim.cmd('setlocal buftype=nofile')
    vim.cmd('setlocal bufhidden=hide')
    vim.cmd('setlocal filetype=' .. file_type)
    vim.cmd.syntax('enable')
    vim.cmd.file(buf_name)
end

local buf_name = '_scratch'


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
