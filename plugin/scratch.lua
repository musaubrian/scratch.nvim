vim.api.nvim_create_user_command("Scratch", function()
    require("scratch").toggle(true)
end, {})

vim.api.nvim_create_user_command("Cscratch", function()
    require("scratch").toggle(false)
end, {})

