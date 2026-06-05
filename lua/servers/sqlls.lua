-- ================================================================================================
-- TITLE : sqls (SQL Language Server) Setup
-- LINKS :
--   > github: https://github.com/sqls-server/sqls
-- ================================================================================================

return function()
	vim.lsp.config("sqls", {
		filetypes = { "sql" },
		settings = {
			sqls = {
				connections = {
					{
						driver = "mysql",
						-- Format: username:password@tcp(host:port)/database_name
						dataSourceName = "root:rootpassword@tcp(127.0.0.1:3306)/your_database",
					},
				},
			},
		},
	})
	vim.lsp.enable("sqls")
end
