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
				ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "tailwindcss", "svelte" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			------------------------------------------------------------------
			-- Lua
			------------------------------------------------------------------
			vim.lsp.config.lua_ls = {
				capabilities = capabilities,
			}

			------------------------------------------------------------------
			-- TypeScript / JavaScript
			------------------------------------------------------------------
			vim.lsp.config.ts_ls = {
				capabilities = capabilities,
				init_options = {
					preferences = {
						importModuleSpecifierPreference = "relative",
						includeAutomaticOptionalChainCompletions = true,
						includeCompletionsForModuleExports = true,
					},
				},
				filetypes = { "typescript", "javascript" },
			}

			------------------------------------------------------------------
			-- Tailwind CSS
			------------------------------------------------------------------
			vim.lsp.config.tailwindcss = {
				capabilities = capabilities,
			}

			------------------------------------------------------------------
			-- Svelte
			------------------------------------------------------------------
			vim.lsp.config.svelte = {
				capabilities = capabilities,
			}

			------------------------------------------------------------------
			-- Rust
			------------------------------------------------------------------
			vim.lsp.config.rust_analyzer = {
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = { group = "module" },
							prefix = "self",
						},
						cargo = {
							buildScripts = { enable = true },
						},
						procMacro = { enable = true },
						completion = {
							autoimport = { enable = true },
						},
					},
				},
			}

			------------------------------------------------------------------
			-- Global LSP keymaps
			------------------------------------------------------------------
			vim.keymap.set("n", "H", vim.lsp.buf.hover)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
		end,
	},
}
