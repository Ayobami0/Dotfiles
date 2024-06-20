return {
  'tpope/vim-fugitive',
  lazy = false,

  keys = {
    { '<leader>gaa', '<cmd>G add .<cr>', desc = '[G]it [a]dd [a]ll' },
    { '<leader>gaf', '<cmd>G add %<cr>', desc = '[G]it [a]dd current [f]ile' },
    { '<leader>gc', '<cmd>G commit<cr>', desc = '[G]it [c]ommit' },
    { '<leader>gp', '<cmd>G push<cr>', desc = '[G]it [p]ush' },
    { '<leader>gP', '<cmd>G pull<cr>', desc = '[G]it [P]ull' },
    { '<leader>gs', '<cmd>G status %<cr>', desc = '[G]it [s]tatus' },
  },
}
