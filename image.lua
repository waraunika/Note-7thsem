-- for neovim only

local api = vim.api
local fn = vim.fn
local img = vim.ui.img

local function parse_image(line)
	local ln = vim.trim(line)
	local is_image = ln:sub(1, 2) == "!["

	if not is_image then
		return nil
	end

	local image = vim.split(ln, "%(")[2]
	image = image:sub(1, #image - 1)
	return image
end

local function resolve_path(file, bufnr)
	if file:sub(1, 1) == "/" or file:sub(1, 1) == "-" then
		return vim.fn.expand(file)
	end
	local buf_dir = vim.fn.expand("#" .. bufnr .. ":p:h")
	return buf_dir .. "/" .. file
end

api.nvim_create_autocmd("CursorMoved", {
	callback = function()
		local win = api.nvim_get_current_win()
		if not api.nvim_win_is_valid(win) then
			return
		end

		local line = api.nvim_get_current_line()
		local raw_file = parse_image(line)

		if raw_file == nil then
			return
		end

		local file = resolve_path(raw_file, api.nvim_get_current_buf())

		if fn.filereadable(file) ~= 1 then
			return
		end

		local content = fn.readblob(file)
		img.set(content, {
			col = 120,
			row = 1,
			width = 70,
			height = 20,
		})
	end,
})
