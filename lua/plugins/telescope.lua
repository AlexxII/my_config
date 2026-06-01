return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>p", builtin.find_files, {})
      vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>gw", builtin.grep_string, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

      require("telescope").setup({
        defaults = {
          preview = {
            treesitter = true,
          },
        },

        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
}
