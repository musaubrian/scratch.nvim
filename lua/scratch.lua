local M = {}

local group = vim.api.nvim_create_augroup("scratch", {})
local enabled = false

M.enabled = function()
    enabled = true
    if enabled then
        local bufNum = vim.fn.bufnr("_scratch")

        if vim.api.nvim_buf_is_valid(bufNum) then
            vim.cmd("buffer" .. bufNum)
        else
            vim.cmd('vsplit splitright')
            vim.cmd('noswapfile hide enew')
            vim.cmd('setlocal buftype=nofile')
            vim.cmd('setlocal bufhidden=hide')
            -- vim.cmd('setlocal nobuflisted')
            vim.cmd('file _scratch')
        end
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
