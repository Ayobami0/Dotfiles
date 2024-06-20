#!/usr/bin/env bash
# Statusbar color
set -g status-bg "colour8"
set -g status-fg "colour7"

# Default window title colors
setw -g window-status-style "dim,fg=color250,bg=default"

# Active window title colors
setw -g window-status-current-style "bright,bg=colour7,fg=color8"

# Pane border
set -g pane-border-style "fg=color8"
set -g pane-active-border-style "fg=color251"

# Message text
set -g message-style "fg=color245,bg=color235"
set -g message-command-style "fg=color245,bg=color235"

# Mode colors
set -g mode-style "fg=color7,bg=color8"

set -g status "on"
set -g status-justify "left"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[bg=#{?#{client_prefix},#ffffff,#000000},fg=#{?#{client_prefix},#000000,#ffffff},bold] #S "
set -g status-right "#{gitmuz} #h "

setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#16161e"
setw -g window-status-separator ""
setw -g window-status-format "#[default] #W #F "
setw -g window-status-current-format "#[fg=color12,bg=color0,bold] #W #F "

