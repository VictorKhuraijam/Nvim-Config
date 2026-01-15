--local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Language Server Protocol (LSP)
--print("Loading lua_ls")
require("servers.lua_ls")()
--require("servers.pyright")(capabilities)

--print("Loading gopls")
require("servers.gopls")()
--require("servers.jsonls")(capabilities)

--print("Loading templ")
require("servers.templ")(capabilities)

--print("Loading ts_ls")
require("servers.ts_ls")(capabilities)
--require("servers.bashls")(capabilities)
--require("servers.clangd")(capabilities)
--require("servers.dockerls")(capabilities)
--require("servers.emmet_ls")(capabilities)
--require("servers.yamlls")(capabilities)

--print("Loading tailwindcss")
require("servers.tailwindcss")(capabilities)
--require("servers.solidity_ls_nomicfoundation")(capabilities)

-- Linters & Formatters
--require("servers.efm-langserver")(capabilities)

--vim.lsp.enable('lua_ls')
--vim.lsp.enable('pyright')
--vim.lsp.enable('gopls')
--vim.lsp.enable('jsonls')
--vim.lsp.enable('ts_ls')
--vim.lsp.enable('bashls')
--vim.lsp.enable('clangd')
--vim.lsp.enable('dockerls')
--vim.lsp.enable('emmet_ls')
--vim.lsp.enable('yamlls')
--vim.lsp.enable('tailwindcss')
--vim.lsp.enable('solidity_ls_nomicfoundation')
--vim.lsp.enable('efm')
