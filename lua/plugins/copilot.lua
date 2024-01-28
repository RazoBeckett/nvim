return {
	"github/copilot.vim",
  config = function()
    vim.keymap.set('i', '<A-r>', 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = true,
    })
    vim.g.copilot_no_tab_map = true
    vim.b.copilot_enabled = true
  end,
}
