local P = {}

function P.setup(required_plugins)
	for i, v in ipairs(required_plugins) do
		if not v.src then
			required_plugins[i] = { src = v }
		end
	end

	vim.pack.add(required_plugins)


	local required_src = {}
	for _, plugin in pairs(required_plugins) do
		required_src[plugin.src] = true
	end

	local installed = vim.pack.get()
	local remove_list = {}
	for _, plugin in pairs(installed) do
		local src = plugin.spec.src
		if not required_src[src] then
			table.insert(remove_list, plugin.spec.name)
		end
	end

	if #remove_list > 0 then
		vim.pack.del(remove_list)
	end
end

return P
