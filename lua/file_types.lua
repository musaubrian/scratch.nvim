local M = {}

M.dets = {
    js = {
        interpreter = "node",
        filetype = "javascript",
        extension = "js"
    },
    ts = {
        interpreter = "npx ts-node -y",
        filetype = "typescript",
        extension = "ts"
    },
    py = {
        interpreter = "python3",
        filetype = "python",
        extension = "py"
    },
    rb = {
        interpreter = "ruby",
        filetype = "ruby",
        extension = "rb"
    },
    lua = {
        interpreter = "lua",
        filetype = "lua",
        extension = "lua"
    },
    php = {
        interpreter = "php",
        filetype = "php",
        extension = "php"
    },
    sh = {
        interpreter = "bash",
        filetype = "bash",
        extension = "sh"
    }
}

return M
