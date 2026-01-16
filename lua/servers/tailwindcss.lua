-- ================================================================================================
-- TITLE : tailwindcss LSP Setup
-- LINKS :
--   > github: https://github.com/tailwindlabs/tailwindcss-intellisense
-- ================================================================================================

-- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
-- @return nil
--return function(capabilities) 	
return function()
  vim.lsp.config('tailwindcss', {
--		capabilities = capabilities,
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/tailwindcss-language-server", "--stdio" },	
		filetypes = {
      "html",
      "css",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
--			"vue",
--			"svelte",
			"templ",
		},
    root_markers = { "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts", "postcss.config.js", "postcss.config.cjs", ".git" },
	})
vim.lsp.enable('tailwindcss')

end
