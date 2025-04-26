return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim", -- For showing type/source iconp
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					before = function(entry, vim_item)
						-- Show source name
						vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
						return vim_item
					end,
				}),
			},
			mapping = {
				["<C-Space>"] = cmp.mapping.complete(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})
	end,
}
