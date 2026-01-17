return {
    "goolord/alpha-nvim",
    lazy = false,
    -- dependencies = { 'nvim-mini/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
--      local startify = require("alpha.themes.startify")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
--    startify.file_icons.provider = "devicons"
--      require("alpha").setup(
--       startify.config
--      )
       local alpha = require("alpha")
       local dashboard = require("alpha.themes.dashboard")
        local function pad_to_center(lines)
            local max_width = 0
            for _, line in ipairs(lines) do
              max_width = math.max(max_width, vim.fn.strdisplaywidth(line))
            end

            local win_width = vim.o.columns
            local pad = math.max(0, math.floor((win_width - max_width) / 2))

            return vim.tbl_map(function(line)
              return string.rep(" ", pad) .. line
            end, lines)
          end 

       dashboard.section.header.val = pad_to_center(vim.split([[
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡀⠠⠄⠐⠂⠄⠶⠊⠿⠿⢯⡷⡦⠰⠢⠤⠄⣀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡀⠠⠄⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⠋⠄⠄⠄⠄⠄⠄⠹⣷⣦⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡊⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣽⣿⣹⣂⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⡜⠰⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣼⣿⣹⣗⣇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣴⣟⠄⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣽⡏⣽⣽⣿⣧⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢹⣷⢁⡅⠂⠄⠄⠄⠐⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢠⡟⢑⣿⣿⣿⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠏⣿⡧⠈⣄⡠⠄⠄⠈⠄⠄⠄⠄⠄⢠⠄⢀⠤⠄⠄⠄⠄⠄⠄⡀⣰⢁⣼⣿⣿⣿⣧⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢠⢸⡯⠢⢙⡗⢦⣀⠄⡄⠄⠄⢀⣀⣠⠞⣠⢈⢀⣀⠄⠠⠴⢤⣴⣟⡾⣻⣿⣿⡏⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠃⣯⢯⡐⢡⡕⠖⠚⠄⠄⠄⠄⠠⡩⠁⠄⠘⠁⠄⠄⠄⠄⠄⢏⢰⡟⣿⣻⣿⣧⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⣿⡟⠈⠂⣀⣠⣤⣬⣦⣤⡀⢕⣷⢀⣤⣄⢓⢠⣤⣴⣿⣿⣷⣮⣈⠘⣻⣿⡄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢹⡀⢴⣿⣿⣿⣿⣿⣿⣿⣿⣏⢿⠋⢈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡝⣿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣜⣇⠙⣻⣿⣿⣿⣿⣿⣿⣿⣿⡷⠄⠈⠩⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢧⣽⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠐⡅⠁⠈⠠⠈⠻⠿⢿⣿⢿⣿⠟⣿⢯⣾⣿⣶⣿⡿⡟⠿⡿⠿⠿⠟⠋⢠⣾⠷⣤⢱⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⢀⢠⣤⡄⡀⠄⠄⠄⠄⠄⠄⠄⠄⠰⣣⠄⠄⠄⢠⠄⠄⢠⡠⢭⣴⡟⠁⣿⣿⣿⣿⣟⣷⣭⣤⣄⣀⡀⠄⣀⣈⣀⡨⠯⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣠⣤⣤⡀⠄⠄
⠄⢐⣶⡿⠏⠇⢖⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠳⠤⣤⡼⢷⣶⣷⣷⣶⣛⣇⣼⣿⣿⣿⣿⣯⣻⣟⣏⣿⣽⣶⣾⣾⣿⡿⠛⠁⠄⠄⠄⠄⠄⠄⠄⠄⢀⣨⠊⠛⢿⣮⣆⠄
⠄⢸⣿⣿⣆⠄⠄⡷⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸⢿⣿⣿⣿⠋⢡⠙⢓⠁⠼⠣⠠⢘⣻⣋⢘⢿⣿⣿⣿⣿⠇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⢴⠇⠄⣠⣿⣿⣟⠄
⠠⣿⣿⣿⣿⣧⣄⡛⢻⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡏⣿⣿⣟⣦⣧⣀⡆⣸⣀⣇⣰⠸⣇⣇⣣⣿⣻⣿⣿⡟⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣠⣒⣜⣠⣼⣿⣿⣿⣿⢄
⢻⠄⢻⣿⣿⢿⣿⣷⡀⠹⢦⣄⠄⠄⠄⠄⠄⠄⠄⠄⢰⡇⢹⣿⣹⣏⡎⢽⠋⡏⢸⠇⢸⡋⣿⠉⡏⢹⣹⡿⣿⡇⠄⠄⠄⠄⠄⠄⠄⠄⡠⡺⠂⢁⣸⣿⣯⣿⣿⣿⠄⡾
⠈⠹⣿⣿⣿⣷⡟⡿⣿⣄⡀⠉⠪⡦⡄⠄⠄⠄⠄⠄⠋⡟⠼⡽⢿⣿⣇⣮⣤⣀⣸⣀⣘⣦⡼⡤⣿⣿⣾⢿⣿⡇⠄⠄⠄⠄⠄⢀⢴⠄⠊⠄⣤⣾⢿⣿⣿⣿⣿⣷⡎⠂
⠄⠄⠄⠈⠉⠘⠛⡻⣮⡻⣿⣶⣄⠈⠑⢷⡠⠄⠄⠄⠄⢻⡄⠈⠢⡙⠳⠿⣤⣠⢸⡄⢰⣸⣇⣷⣿⣧⢫⣿⠿⠁⠄⠄⠄⣄⡦⠋⠁⣠⣼⣿⡿⣿⣟⠟⠃⠉⠁⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠁⠻⢫⢟⡻⣷⣦⣀⠄⠛⠲⣄⡀⠄⠘⢄⢦⡈⠸⣢⠄⠘⠉⠚⠰⠛⠾⡾⢿⣷⡴⠋⠁⢀⢠⠦⠇⠁⣀⣴⣿⢟⢯⡞⠟⠉⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⠹⢺⢝⣿⣷⣄⣄⡈⠙⠲⢤⢀⠑⠕⣄⠄⠄⠄⢀⣢⣠⣀⣀⣶⠷⠋⢀⡄⠆⠋⠁⢀⣠⣾⡿⡛⡵⠎⠃⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠚⠗⡿⡻⣿⣤⣀⠄⠘⠪⢦⡄⡉⠓⠛⠉⠉⠙⠚⠋⡠⡄⠗⠊⠄⣠⣾⣾⢿⢻⠱⠗⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠑⠱⠽⣻⢿⣤⣄⠄⠈⠪⢕⡄⢀⢀⢠⡸⠕⠁⠄⣀⣔⣾⡟⡏⠞⠋⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⠻⢻⣿⣷⣤⡀⠈⠑⠯⢑⢄⣰⣾⣾⡿⠗⠈⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢠⢼⡷⠻⢟⣵⣦⠄⡄⠉⠓⠹⣇⢄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣤⡰⠓⠈⠄⠄⣴⣠⢾⠞⠳⡿⣤⣤⡀⠄⠉⠚⢶⡠⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡀⠄⠖⠃⠁⠄⠄⣀⣤⡾⠛⠉⠄⠄⠄⠄⠁⠛⠿⣤⣀⡀⠄⠈⠙⠓⠠⢄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⡠⠔⠊⢀⣠⠔⢊⣠⣤⠾⠛⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠙⠻⣦⣆⠑⠰⣄⡀⠁⠂⢄⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⠄⠐⠁⣀⣤⠾⢋⣀⡼⡟⠙⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⢿⢦⣄⠙⢷⣤⣄⠄⠓⠠⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⢀⡀⠄⢊⣀⣠⡼⠟⠋⣀⣤⢟⠋⠂⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠹⢻⣦⣄⠙⠻⢷⣤⣀⡑⠠⢄⡀⠄⠄⠄⠄⠄⠄
⢠⡶⠚⠉⢭⣡⣴⣶⢾⣿⣿⣤⣴⣿⡿⠟⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠁⠫⢿⢷⣆⣄⣫⡿⡿⢶⣦⣤⡩⠍⠻⢶⣄
⢻⡟⡀⠄⣼⠏⣣⣶⣾⣿⣿⣿⠟⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠻⣿⣿⣿⣿⣷⣌⠙⣧⡄⢀⢙⡿
⠈⠫⣷⣾⣶⣾⣾⣿⣿⣿⣟⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⣿⣿⣿⣿⣿⣷⣾⣶⣗⡏⠁
⠄⠄⠄⠈⠙⠟⣷⠶⣿⠟⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠻⢿⠤⣴⠺⠙⠉⠄⠄⠄

]],"\n" ,{trimempty = true} ))
dashboard.section.header.opts = {
  position = "center",
  hl = "Type",
}

-- Remove everything else
   dashboard.section.buttons.val = {}
   dashboard.section.footer.val = {}
   dashboard.opts.layout = {
     {type = "padding", val = 1},
     dashboard.section.header,
   }
       alpha.setup(dashboard.opts)



vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Do nothing if a file was passed
    if vim.fn.argc() > 0 then
      local arg = vim.fn.argv(0)
      if vim.fn.isdirectory(arg) == 0 then
        return
      end
    end

    vim.schedule(function()
      require("alpha").start(true)
    end)
  end,
})

    end,
  }


