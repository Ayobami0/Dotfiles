return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  },

  config = function()
    require('nvim-tree').setup {}
  end,
  keys = {
    { '<leader>o', '<cmd>NvimTreeToggle<cr>', desc = 'Open Nvimtree' },
  },
}
