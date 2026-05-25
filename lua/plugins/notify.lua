-- lua/plugins/notify.lua
return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")  -- replace vim.notify with the plugin
   notify.setup({
      timeout = 3000,
      max_width = 80,
      stages = "static",
      render = "compact",
    })

    vim.notify = notify
  end,
}
