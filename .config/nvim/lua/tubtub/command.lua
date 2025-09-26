

vim.api.nvim_create_user_command(
    "Light",
    function ()
        vim.cmd("colorscheme rose-pine-dawn")
    end,
    { desc = "Activates Light Mode" }
)

vim.api.nvim_create_user_command(
    "Dark",
    function ()
        vim.cmd("colorscheme rose-pine-main")
    end,
    { desc = "Activates Dark mode" }
)
