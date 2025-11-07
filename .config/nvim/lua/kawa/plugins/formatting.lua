return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				golang = { "gofmt" },
				ocaml = { "ocamlformat" },
				c = { "clang-format" },
				elixir = { "mix" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000,
			},
		})

		-- elixir formatter
		conform.formatters.mix = {
			command = "mix",
			args = { "format", "-" },
			stdin = true,
			cwd = require("conform.util").root_file({ "mix.exs" }),
		}

		-- ocaml formatter configs
		conform.formatters.ocamlformat = {
			prepend_args = { "-p", "janestreet" },
		}

		-- c formatter configs
		conform.formatters.clang_format = {
			-- prepend_args = {}
		}
		-- 	{ "--enable-outside-detected-project", "-p", "janestreet", "$FILENAME" },

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
