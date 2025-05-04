return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
        { "<M-[>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<M-]>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "<M-\\>", "<C-^>", desc = "Recent Buffer" },
        { "|", "<cmd>bdelete<cr>", desc = "Close buffer" },
    },
    opts = {},
}
