---
title: "Dottmuxconf"
date: 2016-07-18
tags: ['tmux', ' dotfiles']
slug: dot-tumxconf
---
Tmux-Konfig mit grüner Statusleite und veränderten Keybinding.

```
unbind C-b
set -g prefix C-g
bind C-g send-prefix
bind g send-prefix

set-window-option -g window-status-current-style bg=red

# Set window notifications
setw -g monitor-activity on
set -g visual-activity on
setw -g automatic-rename

#emacs key bindings of course
set-window-option -g mode-keys emacs
	
set -g history-limit 10000
set -g default-terminal "xterm-256color"
set -g base-index 1
set -g status-interval 2
```

Eine Kopie dieser Datei findet Ihr auf [github].

  [github]: https://github.com/xunzi/dotfiles.git
