-- ================================================================================================
-- TITLE : ts_ls (TypeScript Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/typescript-language-server/typescript-language-server
-- ================================================================================================

--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
--return function( capabilities)

  return function( )
	vim.lsp.config('ts_ls', {
--		capabilities = capabilities,
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server", "--stdio" },	
		filetypes = {
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
		},
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
		settings = {
			typescript = {
				indentStyle = "space",
				indentSize = 2,
        inlayHints = {
					includeInlayParameterNameHints = 'all',
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				}
			},
      javascript = {
        indentStyle = "space",
        indentSize = 2,
        inlayHints = {
					includeInlayParameterNameHints = 'all',
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				}
      }
		},
	})
vim.lsp.enable('ts_ls')

end
