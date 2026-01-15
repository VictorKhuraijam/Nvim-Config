--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
--return function(capabilities)

  return function()
	vim.lsp.config('templ', {
--		capabilities = capabilities,
		cmd = { vim.fn.stdpath("data") .. "/mason/bin/templ", "lsp" },
		filetypes = { 'templ' },
		root_markers = { 'go.mod', '.git' },
		settings = {},
	})
	
	-- Enable the server immediately after configuring it
	vim.lsp.enable('templ')
end
