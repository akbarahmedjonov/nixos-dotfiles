vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes:1'
vim.cmd('colorscheme gruvbox')
vim.g.mapleader=' '
vim.keymap.set("n", "cd", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "rl", "<CMD>so<CR>", { desc = "Reload Nvim" })
vim.keymap.set("n", "<leader>w", "<CMD>write<CR>", { desc = "Write file" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
if vim.fn.executable('rg') == 1 then
  vim.o.grepprg = "rg --vimgrep --smart-case --"
  vim.o.grepformat = "%f:%l:%c:%m"
end
vim.keymap.set('n', '<leader>/', function()
  local search = vim.fn.input("Grep > ")
  if search ~= "" then
    vim.cmd("grep! " .. search)
    vim.cmd("copen")
  end
end, { desc = 'Grep project with prompt' })
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
--vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

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

vim.lsp.config('nixd', {
	options = {
		capabilities = capabilities,
		cmd = { "nixd" },
		settings = {
			nixd = {
				nixpkgs = {
					expr = "import <nixpkgs> { }",
				},
				formatting = {
					command = { "alejandra" }, 
				},
			},
		},
	},
})

vim.lsp.enable("nixd")

vim.lsp.config('pyright', {
	options = {
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					typeCheckingMode = "basic",
					useLibraryCodeForTypes = true,
				},
			},
		},
	},
})
vim.lsp.enable('pyright')
vim.lsp.enable('basedpyright')
local cmp = require('cmp')

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' }, -- Fetch data from Pyright
		{ name = 'buffer' },   -- Fetch data from open text files
		{ name = 'path' },     -- Fetch data from file paths
	})
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('pyright', {
	options = {
		capabilities = capabilities, -- Pass the capabilities here
		settings = {
			python = {
				analysis = { typeCheckingMode = "basic" }
			}
		}
	}
})

vim.lsp.config('lua_ls', {
	options = {
		settings = {
			Lua = {
				diagnostics = { globals = {'vim'} },
			},
		},
	},
})

vim.lsp.enable('lua_ls')
