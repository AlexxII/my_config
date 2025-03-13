vim.diagnostic.config({
  virtual_text = false, -- Отключает текст ошибки прямо в коде
  float = {
    source = "always", -- Показывает, какой LSP выдал ошибку
  },
})

vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})

vim.keymap.set("n", "K", vim.diagnostic.open_float, { noremap = true, silent = true })
