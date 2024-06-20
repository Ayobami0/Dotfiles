#!/usr/bin/env bash

# TokyoNight colors for Tmux

set -g mode-style "fg=#7aa2f7,bg=#3b4261"

set -g message-style "fg=#7aa2f7,bg=#3b4261"
set -g message-command-style "fg=#7aa2f7,bg=#3b4261"

set -g pane-border-style "fg=#3b4261"
set -g pane-active-border-style "fg=#7aa2f7"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#7aa2f7,bg=#16161e"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#{prefix_highlight}#[fg=#15162e,bg=#7aa2f7,bold]#S "
set -g status-right "#[fg=#7aa2f7,bg=#3b4261] #f %Y-%m-%d  %I:%M %p #[fg=#15162e,bg=#7aa2f7,bold] #h "

setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#16161e"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#a9b1d6,bg=#16161e"
setw -g window-status-format "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#16161e,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261,bold] #I  #W #F "

set -g @prefix_highlight_fg '#15162e'
set -g @prefix_highlight_bg '#7aa2f7'
set -g @prefix_highlight_prefix_prompt '^'
set -g @prefix_highlight_output_prefix ""
set -g @prefix_highlight_output_suffix ""
set -g @prefix_highlight_empty_prompt " "
set -g @prefix_highlight_empty_attr "fg=#15162e,bg=#7aa2f9"

