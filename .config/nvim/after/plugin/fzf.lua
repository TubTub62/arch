vim.keymap.set("n", "<leader>pf", function() require("fzf-lua").files() end, { desc = "Find files" })
