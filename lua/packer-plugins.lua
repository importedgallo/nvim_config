--config for packer plugins


return require('packer').startup(function()

--packer can manage itself
        use 'wbthomason/packer.nvim'

--colourscheme
	use 'folke/tokyonight.nvim'

	require("tokyonight").setup({
	  -- your configuration comes here
	  -- or leave it empty to use the default settings
	  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	  transparent = true, -- Enable this to disable setting the background color
	  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	  styles = {
		    -- Style to be applied to different syntax groups
		    -- Value is any valid attr-list value for `:help nvim_set_hl`
		    comments = { italic = true },
		    keywords = { italic = true },
		    functions = {},
		    variables = {},
		    -- Background styles. Can be "dark", "transparent" or "normal"
		    sidebars = "transparent", -- style for sidebars, see below
		    floats = "transparent", -- style for floating windows
		   },
	  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	  dim_inactive = false, -- dims inactive windows
	  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	  --- You can override specific color groups to use other groups or a hex color
	  --- function will be called with a ColorScheme table
	  ---@param colors ColorScheme
	  on_colors = function(colors) end,

	  --- You can override specific highlights to use other groups or a hex color
	  --- function will be called with a Highlights and ColorScheme table
	  ---@param highlights Highlights
	  ---@param colors ColorScheme
	  on_highlights = function(highlights, colors) end,
	})
	vim.cmd[[colorscheme tokyonight]]

--lualine
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	require('lualine').setup {
	  options = {
	    icons_enabled = true,
	    theme = 'tokyonight', 
	    component_separators = { left = '', right = ''},
	    section_separators = { left = '', right = ''},
	    disabled_filetypes = {
	      statusline = {},
	      winbar = {},
	    },
	    ignore_focus = {},
	    always_divide_middle = true,
	    globalstatus = false,
	    refresh = {
	      statusline = 1000,
	      tabline = 1000,
	      winbar = 1000,
	    }
	  },
	  sections = {
	    lualine_a = {'mode'},
	    lualine_b = {'branch', 'diff', 'diagnostics'},
	    lualine_c = {'filename'},
	    lualine_x = {'encoding', 'fileformat', 'filetype'},
	    lualine_y = {'progress'},
	    lualine_z = {'location'}
	  },
	  inactive_sections = {
	    lualine_a = {},
	    lualine_b = {},
	    lualine_c = {'filename'},
	    lualine_x = {'location'},
	    lualine_y = {},
	    lualine_z = {}
	  },
	  tabline = {},
	  winbar = {},
	  inactive_winbar = {},
	  extensions = {}
	}

--nvim-tree
	use {
	  'kyazdani42/nvim-tree.lua',
	  requires = {
	    'kyazdani42/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded = 1
	vim.g.loaded_netrwPlugin = 1

	-- empty setup using defaults
	require("nvim-tree").setup()

	-- OR setup with some options
	require("nvim-tree").setup({
	  sort_by = "case_sensitive",
	  view = {
	    adaptive_size = true,
	    mappings = {
	      list = {
		{ key = "u", action = "dir_up" },
	      },
	    },
	  },
	  renderer = {
	    group_empty = true,
	  },
	  filters = {
	    dotfiles = true,
	  },
	})

--autopairs
	use {
		"windwp/nvim-autopairs",
	    config = function() require("nvim-autopairs").setup {} end
	}

--treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

--telescope
    use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
end)


