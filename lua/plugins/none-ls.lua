return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettier.with({
				--   extra_args = {"--plugin", "prettier-plugin-svelte"}
				-- }),
				-- null_ls.builtins.diagnostics.eslint_d,
			},
		})
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
