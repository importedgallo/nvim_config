local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
if not status then
	print("Colorscheme not found!")
	return
end

require("tokyonight").setup({
	transparent = true,
	style = "storm",
	styles = {
		keywords = { italic = true },
		comments = { italic = true },
		sidebars = "dark",
	},
})

vim.cmd("colorscheme tokyonight")
