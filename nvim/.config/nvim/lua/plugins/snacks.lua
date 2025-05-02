local commonPickerOptions = {
    hidden = true,
}

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
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
            desc = "[L]azy [G]it",
        },

        -- Picker
        {
            "<leader>ff",
            function()
                Snacks.picker.files(commonPickerOptions)
            end,
            desc = "[F]ind [F]ile",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent(commonPickerOptions)
            end,
            desc = "[F]ind [R]ecent file",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.lines()
            end,
            desc = "[F]ind text in [B]uffer",
        },
        {
            "<leader>fw",
            function()
                Snacks.picker.grep(commonPickerOptions)
            end,
            desc = "[F]ind text in [W]orkspace",
        },
        {
            "<leader>fk",
            function()
                Snacks.picker.keymaps()
            end,
            desc = "[F]ind [K]eymap",
        },
        {
            "<leader>fs",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "[F]ind [S]ymbol",
        },
        {
            "<leader>fR",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "[F]ind [R]eference",
        },
        {
            "<leader>fd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "[F]ind [D]efinition",
        },
        {
            "<leader>fD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "[F]ind [D]eclaration",
        },
        {
            "<leader>fi",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "[F]ind [I]mplementation",
        },

        -- Explorer
        {
            "<leader>e",
            function()
                Snacks.explorer(commonPickerOptions)
            end,
            desc = "[E]xplorer",
        },

        -- Notifier
        {
            "<leader>nh",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "[N]otification [H]istory",
        },
    },
}
