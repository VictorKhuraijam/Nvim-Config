-- ================================================================================================
-- TITLE : bashls (Bash Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/bash-lsp/bash-language-server
-- ================================================================================================

-- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
-- @return nil
return function()
	vim.lsp.config('bashls',{
--		capabilities = capabilities,
		filetypes = { "sh", "bash", "zsh" },
	})
  vim.lsp.enable('bashls')

end
