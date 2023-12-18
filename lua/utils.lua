local file_stuff = require("file_types")
local M = {}
local notif = require("notify")

---check file extenstion and return everything related to that file
---@param extension string
function M.checkExtension(extension)
    for _, v in pairs(file_stuff.dets) do
        if v.extension == extension then
            return v
        end
    end
end

---Checks the file type and returns everything related to that file
---@param file_type string
function M.checkFileType(file_type)
    for _, v in pairs(file_stuff.dets) do
        if v.filetype == file_type then
            return v
        end
    end
end

---@param msg string
---@param level integer
function M.notify(msg, level)
    notif(msg, level, {
        title = "scratch.nvim",
        timeout = 3500,
    })
end

return M
