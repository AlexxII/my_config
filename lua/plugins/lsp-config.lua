return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- Typescript \ Javascript
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				init_options = {
					preferences = {
						importModuleSpecifierPreference = "relative",
						includeAutomaticOptionalChainCompletions = true,
						includeCompletionsForModuleExports = true,
					},
				},
				filetypes = { "typescript", "javascript" },
			})

			-- Tailwind CSS
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			-- Svelte
			lspconfig.svelte.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						pattern = { "*.svelte" },
						callback = function()
							vim.lsp.buf.format({ async = true })
						end,
					})
					-- Добавляем автоимпорт через code actions
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						"<leader>ai",
						"<cmd>lua vim.lsp.buf.code_action({ context = { only = {'source.addMissingImports'} }, apply = true })<CR>",
						{ noremap = true, silent = true }
					)
				end,
			})
			-- Rust с автоимпортом
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
						},
						completion = {
							autoimport = {
								enable = true,
							},
						},
					},
				},
			})

			-- keymaps
			vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}
