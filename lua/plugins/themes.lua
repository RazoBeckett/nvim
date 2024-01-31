return {
  lazy = false,
  priority = 1000,
  terminal_colors = true,
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "catppuccin/nvim",
    config = function()
      vim.o.background = "dark"
      require("catppuccin").setup({
        integrations = {
          harpoon = true,
          cmp = true,
          gitsigns = true,
          treesitter = true,
          treesitter_context = true,
          mason = true,
          native_lsp = { enabled = true },
          neotree = true,
          telescope = true,
          notify = true,
        },
      })

      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
}
