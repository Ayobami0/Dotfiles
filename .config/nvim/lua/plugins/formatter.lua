return { -- Autoformat
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      mode = "n",
      desc = "Format buffer",
    },
  },
  opts = {
    notify_on_error = false,
    -- format_on_save = {
    --   timeout_ms = 250,
    --   lsp_fallback = true,
    -- },
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform can also run multiple formatters sequentially
      python = { "isort", "black" },
      proto = { "buf" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = { "standardjs", "eslint_d" },
      html = { "prettierd" },
      css = { "prettierd" },
    },
  },
}
