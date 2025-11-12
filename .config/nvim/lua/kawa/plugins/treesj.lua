return {
	"Wansmer/treesj",
	keys = { "<leader>tt" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesj").setup({
			use_default_keymap = false,
		})
		vim.keymap.set("n", "<leader>tt", require("treesj").toggle)
		vim.keymap.set("n", "<leader>tj", require("treesj").join)
		vim.keymap.set("n", "<leader>ts", require("treesj").split)
	end,
}
