return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "c", "dockerfile", "python", "javascript", "yaml" },
        auto_install = true,
        autotag = { enable = true },
        rainbow = { enable = true },
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
          --	null_ls.builtins.diagnostics.eslint_d,

          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.diagnostics.ruff,

          null_ls.builtins.formatting.beautysh,
          null_ls.builtins.diagnostics.shellcheck,
        },
      })
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "[G]et [F]ormat" })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false,
        },
      })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
