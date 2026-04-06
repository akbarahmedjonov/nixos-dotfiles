vim.pack.add { 
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/morhetz/gruvbox",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/hrsh7th/cmp-path.git",
	"https://github.com/hrsh7th/cmp-buffer.git",
	"https://github.com/hrsh7th/cmp-nvim-lsp.git",
	"https://github.com/hrsh7th/nvim-cmp.git",
	"https://github.com/typicode/bg.nvim",
}
require("oil").setup()
require('lualine').setup()
