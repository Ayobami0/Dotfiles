local function zen()
  local isTmux = os.getenv('TERM') == "tmux-256color"

  local cmd =
    'killall -SIGUSR1 waybar; '

  if isTmux then
   cmd = cmd .. "tmux set-option -p status; "
  end

  os.execute(cmd)
end
return {
  'folke/zen-mode.nvim',
  keys = {
    { '<leader>z', '<cmd>ZenMode <cr>', desc = 'Zen Mode toggle' },
  },
  opts = {
    on_open = zen,
    on_close = zen,
  },
}
