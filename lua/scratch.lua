local M = {}

local enabled = false

local function createScratchBuff(bufName)
    vim.cmd.set('splitright')
    vim.cmd.vsplit()
    vim.cmd('vertical resize 65')
    vim.cmd('noswapfile hide enew')
    vim.cmd('setlocal buftype=nofile')
    vim.cmd('setlocal bufhidden=hide')
    vim.cmd.file(bufName)
end

local bufName = '_scratch'

M.enabled = function()
    enabled = true
    if enabled then
        local bufNum = vim.fn.bufnr(bufName)
        if vim.api.nvim_buf_is_valid(bufNum) then
            vim.cmd.bdelete(bufName)
            createScratchBuff(bufName)
        else
            createScratchBuff(bufName)
        end
    end
end

M.disabled = function()
    enabled = false
    vim.cmd.bdelete(bufName)
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
