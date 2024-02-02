return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("alpha.themes.startify")
		local logo = {
			"",
			" ██████╗  █████╗ ███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			" ██╔══██╗██╔══██╗╚══███╔╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			" ██████╔╝███████║  ███╔╝ ██║   ██║██║   ██║██║██╔████╔██║ ",
			" ██╔══██╗██╔══██║ ███╔╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			" ██║  ██║██║  ██║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			" ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			" - github.com/razobeckett/nvim    - linktr.ee/razobeckett ",
			"",
		}
		dashboard.section.header.val = logo
		require("alpha").setup(dashboard.opts)
	end,
	--config = function()
	--  require("alpha").setup(require("alpha.themes.startify").config)
	--end,
}
