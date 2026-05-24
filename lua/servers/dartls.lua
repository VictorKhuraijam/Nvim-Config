-- ================================================================================================
-- TITLE : dartls (Dart Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/dart-lang/sdk/tree/main/pkg/analysis_server
--   > lspconfig: https://github.com/neovim/nvim-lspconfig/blob/master/lsp/dartls.lua
-- NOTE  : dartls ships inside the Flutter/Dart SDK — not installable via Mason.
--         Ensure `dart` is on your $PATH: `dart --version` should work in terminal.
-- ================================================================================================

return function()
  vim.lsp.config('dartls', {
    cmd = { "dart", "language-server", "--protocol=lsp" },
    filetypes = { "dart" },
    root_markers = { "pubspec.yaml", ".git" },
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = false,
      suggestFromUnimportedLibraries = true,
      closingLabels = true,
      outline = true,
      flutterOutline = true,
    },
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
      },
    },
  })
  vim.lsp.enable('dartls')
end
