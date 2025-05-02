return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>fmt",
            function(  )
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "biome" },
                javascriptreact = { "biome" },
                typescript = { "biome" },
                typescriptreact = { "biome" },
                kdl = { "kdlfmt" },
                zsh = { "zshfmt" },
                cs = { "dotnet_format" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true, -- Fallback to LSP formatting if no formatter available
            },
        })
    end,
}
