vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Exit to remove highlighting" })

-- incrementing and decrementing numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window manager
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Keep the same size for splits" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<Tab>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<S-Tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tc", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Sources data" })
keymap.set("n", "<space>x", "<cmd>:.lua<CR>")
keymap.set("v", "<space>x", "<cmd>:lua<CR>")

-- disable arrows (to improve muscle memory)
local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

vim.api.nvim_set_keymap("i", "<Up>", "<C-o>" .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("i", "<Down>", "<C-o>" .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("i", "<Left>", "<C-o>" .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("i", "<Right>", "<C-o>" .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Up>", msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Down>", msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Left>", msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Right>", msg, { noremap = true, silent = false })

-- custom script
vim.api.nvim_create_user_command("Gen", function(opts)
	local argument = opts.args or ""
	vim.cmd("r !gen " .. argument)
end, { nargs = "?" })
