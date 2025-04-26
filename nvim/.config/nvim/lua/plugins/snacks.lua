return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = { enabled = true },
		bigfile = { enabled = true },
		animate = { enabled = true },
		indent = { enabled = true },
		notifier = { enabled = true },
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
					layout = { layout = { position = "float", min_width = 60, width = 0.8, height = 0.8 } },

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

		-- Terminal
		{
			"<C-\\>",
			function()
				Snacks.terminal({})
			end,
			desc = "Toggle Terminal",
		},
		{
			"<C-/><C\\>",
			function()
				Snacks.terminal({ direction = "float" })
			end,
			desc = "Toggle Float Terminal",
		},

		-- Picker
		{
			"<leader>ff",
			function()
				Snacks.picker.files({ hidden = true })
			end,
			desc = "Find Files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({ hidden = true })
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files({ hidden = true })
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent({ hidden = true })
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
				Snacks.picker.grep_buffers({ hidden = true })
			end,
			desc = "Search Open Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep({ hidden = true })
			end,
			desc = "Search Grep",
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
				Snacks.explorer({ hidden = true })
			end,
			desc = "File Explorer",
		},
	},
}
