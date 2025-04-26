return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
        local function attached_lsp()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then
        return '󱈬 No LSP'
      end
      
      local client_names = {}
      for _, client in ipairs(clients) do
        -- Skip null-ls if you want (uncomment next line)
        -- if client.name ~= 'null-ls' then
          table.insert(client_names, client.name)
        -- end
      end
      
      return '󱂬 ' .. table.concat(client_names, ', ')
    end
		require('lualine').setup({
			options = {
				theme = 'palenight',
				component_separators = '|',
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { attached_lsp, 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
		})
	end
}
