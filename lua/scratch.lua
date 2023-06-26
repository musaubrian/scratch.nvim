local M = {}

local group = vim.api.nvim_create_augroup("scratch", {})
local enabled = false

M.enabled = function()
    enabled = true
    if enabled then
        vim.cmd.vsplit()
        -- vim.cmd('split')
        vim.cmd('noswapfile hide enew')
        vim.cmd('setlocal buftype=nofile')
        vim.cmd('setlocal bufhidden=hide')
        -- vim.cmd('setlocal nobuflisted')
        vim.cmd('file scratch')
    end
end

M.disable = function()
    enabled = false
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
