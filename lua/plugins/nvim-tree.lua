-- ================================================================================================
-- TITLE : nvim-tree.lua
-- ABOUT : A file explorer tree for Neovim, written in Lua.
-- LINKS :
--   > github : https://github.com/nvim-tree/nvim-tree.lua
-- ================================================================================================

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		-- Remove background color from the NvimTree window (ui fix)

    vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

		require("nvim-tree").setup({
  		git = {
        ignore = false,
      },	
      filters = {
				dotfiles = false, -- Show hidden files (dotfiles)
			},
			view = {
				adaptive_size = true,
			},
      ui = {
          confirm = {
            remove = true,
            trash = true,
          },
        },
        -- Use floating input window instead of command line
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end
          
          -- Default mappings
          api.config.mappings.default_on_attach(bufnr)
          
          -- Override 'a' to use floating input
          vim.keymap.set("n", "a", api.fs.create, opts("Create"))
        end,
      })
    end,
  }
