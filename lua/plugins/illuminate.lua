return {
	"RRethy/vim-illuminate",
	config = function()
		-- Настройка плагина
		require("illuminate").configure({})

		-- Функция для применения стилей
		local function set_illuminated_word_highlights()
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
		end

		-- Применить стили сразу после загрузки
		set_illuminated_word_highlights()

		-- Автоматическое обновление стилей при смене цветовой схемы
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = set_illuminated_word_highlights,
		})
	end,
}
