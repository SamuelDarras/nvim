local M = {}

local default_autocmds = {
	{
		'TextYankPost',
		{
			group = vim.api.nvim_create_augroup('darras-highlight_yank', {}),
			desc = 'Hightlight selection on yank',
			callback = function()
				vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }
			end,
		}
	},
}

function M.setup(additional)
	additional = additional or {}

	vim.list_extend(default_autocmds, additional)

	for _, autocmd in pairs(default_autocmds) do
		vim.api.nvim_create_autocmd(unpack(autocmd))
	end
end

return M
