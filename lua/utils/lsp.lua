local M = {}

M.on_attach = function(event)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if not client then
		return
	end
	local bufnr = event.buf
	local keymap = vim.keymap.set
	local opts = {
		noremap = true, -- prevent recursive mapping
		silent = true, -- don't print the command to the cli
		buffer = bufnr, -- restrict the keymap to the local buffer number
	}

	-- native neovim keymaps
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>gd", vim.lsp.buf.definition, opts)
  keymap("n", "<leader>gD", vim.lsp.buf.declaration, opts)
  keymap("n", "<leader>gS", function()
    vim.cmd("vsplit")
    vim.lsp.buf.definition()
  end, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>D", vim.diagnostic.open_float, opts)
  keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
  keymap("n", "<leader>pd", vim.diagnostic.goto_prev, opts)
  keymap("n", "<leader>nd", vim.diagnostic.goto_next, opts)

  -- fzf-lua keymaps
	keymap("n", "<leader>fd", "<cmd>fzflua lsp_finder<cr>", opts) -- lsp finder (definition + references)
	keymap("n", "<leader>fr", "<cmd>fzflua lsp_references<cr>", opts) -- show all references to the symbol under the cursor
	keymap("n", "<leader>ft", "<cmd>fzflua lsp_typedefs<cr>", opts) -- jump to the type definition of the symbol under the cursor
	keymap("n", "<leader>fs", "<cmd>fzflua lsp_document_symbols<cr>", opts) -- list all symbols (functions, classes, etc.) in the current file
	keymap("n", "<leader>fw", "<cmd>fzflua lsp_workspace_symbols<cr>", opts) -- search for any symbol across the entire project/workspace
	keymap("n", "<leader>fi", "<cmd>fzflua lsp_implementations<cr>", opts) -- go to implementation

	-- order imports (if supported by the client lsp)
	if client:supports_method("textdocument/codeaction", bufnr) then
		keymap("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source.organizeimports" },
					diagnostics = {},
				},
				apply = true,
				bufnr = bufnr,
			})
			-- format after changing import order
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50) -- slight delay to allow for the import order to go first
		end, opts)
	end

  -- ===dap keymaps ===
--	if client.name == "rust-analyzer" then -- debugging only configured for rust
--		local dap = require("dap")
--		keymap("n", "<leader>dc", dap.continue, opts) -- continue / start
--		keymap("n", "<leader>do", dap.step_over, opts) -- step over
--		keymap("n", "<leader>di", dap.step_into, opts) -- step into
--		keymap("n", "<leader>du", dap.step_out, opts) -- step out
--		keymap("n", "<leader>db", dap.toggle_breakpoint, opts) -- toggle breakpoint
--		keymap("n", "<leader>dr", dap.repl.open, opts) -- open dap repl
--	end

end

return M
