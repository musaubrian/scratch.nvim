local utils = require("utils")
local file_types = require("file_types")

vim.api.nvim_create_user_command("Scratch", function(args)
    local ext = args.args
    local err_msg = string.format("Filetype [%s] is not supported", ext)
    if ext ~= nil then
        local res = utils.checkExtension(ext)
        if res ~= nil then
            require("scratch").toggle(true, res.filetype)
        else
            vim.notify(err_msg, vim.log.levels.ERROR)
        end
    end
end, {
    nargs = 1,
    complete = function(_, _, _)
        local res = {}
        for _, v in pairs(file_types.dets) do
            table.insert(res, v.extension)
        end
        return res
    end
})

vim.api.nvim_create_user_command("RScratch", function()
    local sys_name = vim.loop.os_uname().sysname
    local interpreter = ""

    local file_type = vim.bo.filetype
    local f = utils.checkFileType(file_type)
    interpreter = f.interpreter

    if f.filetype == "txt" then
        vim.notify("Text files can't be interprated", vim.log.levels.INFO)
    end

    if interpreter == "python3" and sys_name == "Windows" then
        interpreter = "python"
    end

    vim.cmd("w !" .. interpreter)
end, {})
