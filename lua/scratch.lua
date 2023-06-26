local M = {}

local enabled = false

local function createScratch(bufName)
    vim.cmd.set('splitbelow')
    vim.cmd.set('splitright')
    vim.cmd.vsplit()
    vim.cmd('vertical resize 65')
    vim.cmd('noswapfile hide enew')
    vim.cmd('setlocal buftype=nofile')
    vim.cmd('setlocal bufhidden=hide')
    vim.cmd.file(bufName)
end

M.enabled = function()
    enabled = true
    if enabled then
        local bufNum = vim.fn.bufnr("_scratch")
        local bufName = '_scratch'
        if vim.api.nvim_buf_is_valid(bufNum) then
            vim.cmd('bdelete ' .. bufName)
            createScratch(bufName)
        else
            createScratch(bufName)
        end
    end
end

M.disabled = function()
    enabled = false
    vim.cmd('bdelete _scratch')
end


M.toggle = function(val)
    if val == nil then
        return M.toggle(not enabled)
    end
    if val then
        M.enabled()
    else
        M.disabled()
    end
end

return M
