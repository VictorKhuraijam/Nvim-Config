-- flutter-tools.nvim gives you: hot reload, device picker, widget outlines,
-- color preview inline, Flutter-specific commands.
-- It manages its own LSP attachment on top of dartls — they work together.

return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      ui = {
        border = "rounded",
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        enabled = true,
        prefix = "// ",
        highlight = "Comment",
      },
      dev_log = {
        enabled = true,
        open_cmd = "tabedit",
      },
      outline = {
        open_cmd = "30vnew",
        auto_open = false,
      },
      lsp = {
        -- Reuse your existing on_attach from utils/lsp.lua
        on_attach = require("utils.lsp").on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        --color = {
        --  enabled = true,
        --  virtual_text = true,
        --  virtual_text_str = "■",
        --},
        settings = {
          dart = {
            completeFunctionCalls = true,
            showTodos = true,
          },
        },
      },
    })
  end,
}
