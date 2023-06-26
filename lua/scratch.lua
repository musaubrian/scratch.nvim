local M = {}

local group = vim.api.nvim_create_augroup("scratch", {})
local enabled = false

local function switchToBufferIfExists(bufName)
    local bufNum = vim.fn.bufnr(bufName)
    if bufNum ~= -1 then
        vim.cmd('buffer ' .. bufNum)
    end
end

M.enabled = function()
    enabled = true
    if enabled then
        switchToBufferIfExists("_scratch")
        vim.cmd('vsplit splitright')
        vim.cmd('noswapfile hide enew')
        vim.cmd('setlocal buftype=nofile')
        vim.cmd('setlocal bufhidden=hide')
        -- vim.cmd('setlocal nobuflisted')
        vim.cmd('file _scratch')
    end
end

M.disable = function()
    enabled = false
    vim.cmd('bdelete _scratch')
    vim.api.nvim_clear_autocmds { group = group }
end


M.toggle = function(val)
    if val == nil then
        return M.toggle(not enabled)
    end
    if val then
        M.enabled()
    else
        M.disable()
    end
end

return M
