local commonPickerOptions = {
    hidden = true,
}

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    init = function()
        vim.keymap.set("n", "<M-/>", function()
            if vim.v.count1 == 2 then
                Snacks.terminal(nil, { win = { position = "float" } })
            else
                Snacks.terminal(nil, { win = { position = "bottom" } })
            end
        end)
        vim.keymap.set("t", "<M-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
    end,
    opts = {
        dashboard = { enabled = true },
        bigfile = { enabled = true },
        animate = { enabled = true },
        indent = { enabled = true },
        notifier = {
            enabled = true,
            width = { min = 40, max = 0.8 },
            height = { min = 1, max = 0.8 },
        },
        scroll = { enabled = true },
        lazygit = { enabled = true },
        terminal = { enabled = true },
        rename = { enabled = true },
        picker = {
            enabled = true,
            win = {
                input = {
                    keys = {
                        ["<Esc>"] = { "close", mode = { "n", "i" } },

                        ["<c-j>"] = { "list_down", mode = { "i", "n" } },
                        ["<c-k>"] = { "list_up", mode = { "i", "n" } },

                        ["/"] = "toggle_focus",
                    },
                },
            },
            matcher = {
                frecency = true,
                history_bonus = true,
                cwd_bonus = true,
            },
            sources = {
                explorer = {
                    layout = {
                        layout = {
                            position = "float",
                            min_width = 60,
                            width = 0.8,
                            height = 0.8,
                        },
                    },

                    auto_close = true,
                },
            },
        },
        explorer = { enabled = true },
    },
    keys = {
        -- LazyGit
        {
            "<leader>lg",
            function()
                Snacks.lazygit()
            end,
            desc = "Open [L]azy[G]it",
        },

        -- Picker
        {
            "<leader>ff",
            function()
                Snacks.picker.files(commonPickerOptions)
            end,
            desc = "Find Files",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers(commonPickerOptions)
            end,
            desc = "Find Buffers",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.git_files(commonPickerOptions)
            end,
            desc = "Find Git Files",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent(commonPickerOptions)
            end,
            desc = "Recent",
        },
        {
            "<leader>sb",
            function()
                Snacks.picker.lines()
            end,
            desc = "Search Buffer Lines",
        },
        {
            "<leader>sB",
            function()
                Snacks.picker.grep_buffers(commonPickerOptions)
            end,
            desc = "Search Open Buffers",
        },
        {
            "<leader>sg",
            function()
                Snacks.picker.grep(commonPickerOptions)
            end,
            desc = "Search Grep",
        },
        {
            "<leader>sk",
            function()
                Snacks.picker.keymaps()
            end,
            desc = "Keymaps",
        },
        {
            "<leader>ss",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>sS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },

        -- LSP
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "gD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "Goto Declaration",
        },
        {
            "gr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gI",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },

        -- Explorer
        {
            "<leader>e",
            function()
                Snacks.explorer(commonPickerOptions)
            end,
            desc = "File Explorer",
        },

        -- Rename
        {
            "<leader>rf",
            function()
                Snacks.rename.rename_file()
            end,
            desc = "Rename File",
        },

        -- Notifier
        {
            "<leader>nh",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "Notification History",
        },
    },
}
