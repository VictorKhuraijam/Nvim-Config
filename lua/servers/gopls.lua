-- ================================================================================================
-- TITLE : gopls (Golang Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/golang/tools/tree/master/gopls
-- ================================================================================================

-- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
-- @return nil
--return function(capabilities)

  return function()
	vim.lsp.config('gopls', {
--		capabilities = capabilities,
		filetypes = { "go", 'gomod', 'gowork', 'gotmpl', 'templ'  },
    root_markers = { "go.work", "go.mod", ".git" },
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
	})
vim.lsp.enable('gopls')

end
