return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local function get_conform_formatter()
            -- Get the current filetype
            local ft = vim.bo.filetype
            if not ft or ft == "" then
                return "No formatter" -- No filetype, no formatter
            end

            -- Get Conform's formatters for this filetype
            local conform = require("conform")
            local formatters = conform.formatters_by_ft[ft] or {}

            -- If multiple formatters are assigned, join them with a comma
            if #formatters > 0 then
                return "󰉢 " .. table.concat(formatters, ", ")
            else
                return "No formatter" -- No formatter assigned
            end
        end

        require("lualine").setup({
            options = {
                component_separators = "|",
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "filetype", "lsp_status", get_conform_formatter },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
