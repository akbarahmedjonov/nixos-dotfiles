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
