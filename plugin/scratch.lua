require("file_types")
local utils = require("utils")

vim.api.nvim_create_user_command("Scratch", function(args)
    local ext = args.args
    local msg = string.format("Filetype [%s] is not supported", ext)
    if ext ~= nil then
        local res = utils.checkExtension(ext)
        if res ~= nil then
            require("scratch").toggle(true, res.filetype)
        else
            vim.notify(msg, vim.log.levels.ERROR)
        end
    end
end, {
    nargs = 1,
})

vim.api.nvim_create_user_command("RScratch", function()
    local sys_name = vim.loop.os_uname().sysname
    local interpreter = ""

    local file_type = vim.bo.filetype
    local f = utils.checkFileType(file_type)
    interpreter = f.interpreter

    if interpreter == "python3" and sys_name == "Windows" then
        interpreter = "python"
    end

    vim.cmd("w !" .. interpreter)
end, {})
