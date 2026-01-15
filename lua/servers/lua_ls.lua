-- ================================================================================================
-- title : lua_ls (lua language server) lsp setup
-- links :
--   > github: https://github.com/luals/lua-language-server
-- ================================================================================================

--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
--return function(capabilities)
	

return function()
  vim.lsp.config('lua_ls', {
--		capabilities = capabilities,
		cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
		filetypes = { 'lua' },
		root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
					},
				},
			},
		},
	})
	
	-- Enable the server immediately after configuring it
	vim.lsp.enable('lua_ls')
end
