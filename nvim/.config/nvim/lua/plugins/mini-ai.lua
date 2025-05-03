return {
    {
        "echasnovski/mini.ai",
        version = false,
        config = function()
            require("mini.ai").setup({
                -- Clear all default textobjects
                custom_textobjects = nil,

                -- Define only the textobjects we want
                textobjects = {
                    -- Function (supports different styles)
                    f = require("mini.ai").gen_spec.treesitter({
                        a = "@function.outer",
                        i = "@function.inner",
                    }),

                    -- Block (like if/for/while blocks)
                    B = require("mini.ai").gen_spec.treesitter({
                        a = "@block.outer",
                        i = "@block.inner",
                    }),

                    -- Class (works in OOP languages)
                    c = require("mini.ai").gen_spec.treesitter({
                        a = "@class.outer",
                        i = "@class.inner",
                    }),

                    -- Argument/parameter
                    a = require("mini.ai").gen_spec.treesitter({
                        a = "@parameter.outer",
                        i = "@parameter.inner",
                    }),

                    -- Quotes (single, double, backtick)
                    q = {
                        require("mini.ai").gen_spec.treesitter({ a = "@quote.outer", i = "@quote.inner" }),
                        require("mini.ai").gen_spec.pair("'", "'", { type = "balanced" }),
                        require("mini.ai").gen_spec.pair('"', '"', { type = "balanced" }),
                        require("mini.ai").gen_spec.pair("`", "`", { type = "balanced" }),
                    },

                    -- Brackets (any kind: (), [], {}, <>, etc.)
                    k = {
                        require("mini.ai").gen_spec.treesitter({ a = "@bracket.outer", i = "@bracket.inner" }),
                        require("mini.ai").gen_spec.pair("(", ")", { type = "balanced" }),
                        require("mini.ai").gen_spec.pair("[", "]", { type = "balanced" }),
                        require("mini.ai").gen_spec.pair("{", "}", { type = "balanced" }),
                        require("mini.ai").gen_spec.pair("<", ">", { type = "balanced" }),
                    },
                },
            })
        end,
    },
}
