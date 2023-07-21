vim.api.nvim_create_user_command("Scratch", function()
    require("scratch").toggle(true)
end, {})

vim.api.nvim_create_user_command("RScratch", function()
    local interprator = vim.fn.input("Interprator> ")
    if interprator == "ts" then
        vim.cmd("w !nxp ts-node")
    else
        vim.cmd("w !" .. interprator)
    end
end, {})
