return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				keymap.set("n", "<leader>ra", vim.lsp.buf.rename, opts)
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		require("mason").setup()

		local servers = {
			"lua_ls",
			"pyright",
			"clangd",
			"elixirls",
			"html",
			"tailwindcss",
			"cssls",
		}

		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						flags = { debounce_text_changes = 300 },
					})
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						flags = { debounce_text_changes = 300 },
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								completion = { callSnippet = "Replace" },
							},
						},
					})
				end,

				["html"] = function()
					require("lspconfig").html.setup({
						capabilities = capabilities,
						flags = { debounce_text_changes = 300 },
						filetypes = { "html", "heex", "eex" },
						settings = {
							html = {
								format = { enable = true, wrapLineLength = 120, indentInnerHtml = true },
								validate = true,
								hover = { documentation = true, references = true },
							},
						},
					})
				end,

				["tailwindcss"] = function()
					require("lspconfig").tailwindcss.setup({
						capabilities = capabilities,
						flags = { debounce_text_changes = 300 },
						filetypes = { "html", "heex", "eelixir", "elixir" },
						init_options = {
							userLanguages = { elixir = "html-eex", eelixir = "html-eex", heex = "html" },
						},
					})
				end,

				["clangd"] = function()
					require("lspconfig").clangd.setup({
						capabilities = capabilities,
						flags = { debounce_text_changes = 300 },
						cmd = { "clangd", "--header-insertion=never", "--clang-tidy", "--completion-style=detailed" },
					})
				end,

				["elixirls"] = function()
					require("lspconfig").elixirls.setup({
						cmd = { "/opt/homebrew/bin/elixir-ls" },
						filetypes = { "elixir", "eelixir" },
						root_dir = require("lspconfig.util").root_pattern("mix.x"),
						capabilities = capabilities,
						flags = { debounce_text_changes = 300 },
						settings = {
							elixirLS = {
								dialyzerEnabled = false,
								fetchDeps = true,
								suggestSpecs = true,
								enableTestLenses = true,
							},
						},
					})
				end,
			},
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
