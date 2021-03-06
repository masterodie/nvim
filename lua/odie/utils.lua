function exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

--- Check if a directory exists in this path
function isdir(path)
	-- "/" works on both Unix and Windows
	return exists(path .. "/")
end

function install_lsp()
	local servers = {
		"html",
		"css",
		"json",
		"python",
		"lua",
		"volar",
		"tailwindcss",
	}

	for _, server in ipairs(servers) do
		vim.cmd("LspInstall " .. server)
	end
end
