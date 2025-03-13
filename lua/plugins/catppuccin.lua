return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin-mocha")

		-- Прозрачность фона для активного окна
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		-- Фон для неактивного окна 
		-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) 
		-- vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
	end,
}
