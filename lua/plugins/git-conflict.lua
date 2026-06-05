return {
	"akinsho/git-conflict.nvim",
	version = "*", -- Uses the latest stable release
	config = function()
		require("git-conflict").setup({
			default_mappings = true, -- Automatically sets up the standard TUI keymaps
			disable_diagnostics = false, -- Turns off LSP syntax errors inside conflict zones
			list_opener = "copen", -- Automatically opens the quickfix list for multi-file conflicts
			highlights = { -- Optional: Customize your TUI look (uses terminal background colors)
				incoming = "DiffText",
				current = "DiffAdd",
			},
		})
	end,
}
