return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
        { "<M-[>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<M-]>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
        options = {
            close_command = function(n)
                Snacks.bufdelete(n)
            end,
            right_mouse_command = function(n)
                Snacks.bufdelete(n)
            end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)

        -- Fix bufferline when restoring a session
        vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,
}
