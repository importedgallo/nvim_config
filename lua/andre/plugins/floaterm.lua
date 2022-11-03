-- import floaterm safely
local floaterm_setup, floaterm = pcall(require, "vim-floaterm")
if not floaterm_setup then
	return
end

--configurations
