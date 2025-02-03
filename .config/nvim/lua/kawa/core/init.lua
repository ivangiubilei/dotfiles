require("kawa.core.options")
require("kawa.core.keymaps")

-- custom border style
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded", -- Options: "single", "double", "rounded", "solid", "shadow"
})
