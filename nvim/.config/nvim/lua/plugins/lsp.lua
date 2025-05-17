return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "j-hui/fidget.nvim", opts = {} },
            "saghen/blink.cmp",
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup({
                        ensure_installed = {},
                        automatic_installation = false,
                        handlers = {
                            function(server_name)
                                local capabilities = require("blink.cmp").get_lsp_capabilities()
                                local servers = {
                                    lua_ls = { -- lua-language-server
                                        settings = {
                                            Lua = {
                                                completion = {
                                                    callSnippet = "Replace",
                                                },
                                                workspace = {
                                                    -- Make the server aware of Neovim runtime files and plugins
                                                    library = { vim.env.VIMRUNTIME },
                                                },
                                            },
                                        },
                                    },
                                    biome = {
                                        filetypes = {
                                            "json",
                                            "javascript",
                                            "typescript",
                                            "javascriptreact",
                                            "typescriptreact",
                                        },
                                    },
                                }

                                local server = servers[server_name] or {}
                                server.capabilities =
                                    vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                                require("lspconfig")[server_name].setup(server)
                            end,
                        },
                    })
                end,
            },
            {
                "williamboman/mason.nvim",
                dependencies = {
                    "WhoIsSethDaniel/mason-tool-installer.nvim",
                },
                opts = function()
                    local ensure_installed = {
                        "stylua", -- lua formatter
                        "selene", -- lua linter
                        "lua-language-server", -- lua lsp

                        "tailwindcss-language-server", -- tailwindcss lsp
                        "typescript-language-server", -- typescript lsp
                        "biome",
                    }

                    require("mason-tool-installer").setup({
                        ensure_installed = ensure_installed,
                    })
                end,
            },
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
                callback = function(event)
                    vim.keymap.set(
                        "n",
                        "<leader>rr",
                        vim.lsp.buf.rename,
                        { buffer = event.buf, desc = "[R]efactor [R]ename" }
                    )
                    vim.keymap.set(
                        { "n", "x" },
                        "<leader>ra",
                        vim.lsp.buf.code_action,
                        { buffer = event.buf, desc = "[R]efactor [A]ction" }
                    )

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if
                        client
                        and client.supports_method(
                            vim.lsp.protocol.Methods.textDocument_documentHighlight,
                            { bufnr = event.buf }
                        )
                    then
                        local highlight_augroup = vim.api.nvim_create_augroup("custom-lsp-highlight", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup("custom-lsp-detach", { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({ group = "custom-lsp-highlight", buffer = event2.buf })
                            end,
                        })
                    end
                end,
            })

            vim.diagnostic.config({
                severity_sort = true,
                float = { border = "rounded", source = "if_many" },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = vim.g.have_nerd_font and {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "󰅚 ",
                        [vim.diagnostic.severity.WARN] = "󰀪 ",
                        [vim.diagnostic.severity.INFO] = "󰋽 ",
                        [vim.diagnostic.severity.HINT] = "󰌶 ",
                    },
                } or {},
                virtual_text = {
                    source = "if_many",
                    spacing = 2,
                    format = function(diagnostic)
                        local diagnostic_message = {
                            [vim.diagnostic.severity.ERROR] = diagnostic.message,
                            [vim.diagnostic.severity.WARN] = diagnostic.message,
                            [vim.diagnostic.severity.INFO] = diagnostic.message,
                            [vim.diagnostic.severity.HINT] = diagnostic.message,
                        }
                        return diagnostic_message[diagnostic.severity]
                    end,
                },
            })
        end,
    },
}
