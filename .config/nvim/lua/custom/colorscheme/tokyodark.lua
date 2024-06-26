return {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        style = 'night', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = 'day', -- The theme is used when the background is set to light
      }
    end,
}
