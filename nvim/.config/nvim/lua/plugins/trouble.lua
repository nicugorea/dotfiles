return {
    "folke/trouble.nvim",
    opts = {
        focus = true,
        win = { type = "float", focus = true },
        keys = {

            -- The defaults for these are reversed but when having a floating window I want it to close on <cr>
            o = "jump",
            ["<cr>"] = "jump_close",
        },
    },
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
    },
}
