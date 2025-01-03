return {
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {},
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	config = function()
		require("render-markdown").setup({
			code = {
				enabled = true,
				sign = true,
				style = "normal",
				position = "left",
				language_pad = 2,
				disable_background = { "diff", "c", "go", "python", "elixir", "rust", "java", "kotlin" },
				width = "block",
				left_pad = 2,
				right_pad = 4,
				min_width = 0,
				border = "thin",
				above = "▄",
				below = "▀",
				highlight = "RenderMarkdownCode",
				highlight_inline = "RenderMarkdownCodeInline",
			},
			heading = {
				position = "inline",
			},
			checkbox = {
				enabled = true,
				unchecked = { icon = "✘ " },
				checked = { icon = "✔ " },
				custom = {
					todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
				},
				position = "overlay",
			},
		})
	end,
}
