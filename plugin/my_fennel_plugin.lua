local fn = vim.fn
local au, augroup = api.nvim_create_autocmd, api.nvim_create_augroup

if vim.f.loaded_myplugin then
	return
end
vim.g.loaded_myplugin = true

local myplugin = augroup("myplugin", { clear = true })

au({ "BufNewFile", "BufRead", "BufFilePost" }, {
	pattern = { "*" },
	once = true,
	callback = function()
		require("myplugin").config()
	end,
})
