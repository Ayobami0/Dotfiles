return {
  "folke/trouble.nvim",
  opts = {
    focus = true,
    auto_close = true,
    follow = true,
    warn_no_results = false,
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>q",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    {
      "<leader>t",
      "<cmd>Trouble todo toggle<cr>",
      desc = "Todo List (Trouble)",
    },
  },
}
