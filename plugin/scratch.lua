vim.api.nvim_create_user_command("Scratch", function()
    require("scratch").toggle(true)
end, {})
