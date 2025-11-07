return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
			},
			-- optional: fine-tune behaviour per filetype
			per_filetype = {
				["html"] = {
					enable_close = true,
					enable_rename = true,
				},
				["heex"] = {
					enable_close = true,
					enable_rename = true,
				},
				["eex"] = {
					enable_close = true,
				},
			},
		})
	end,
}
