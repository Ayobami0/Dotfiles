return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = true,
  keys = {
    { '<leader>g', vim.cmd.Neogit, desc = 'Neogit' }
  }
}
  -- return {
  --   "tpope/vim-fugitive",
  --   keys = {
  --     { "<leader>gg", vim.cmd.Git, desc = "Git" },
  --   },
  -- },
