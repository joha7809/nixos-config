[
  "$mod, RETURN, exec, kitty"
  "$mod, D, exec, wofi --show drun"
  "$mod, V, exec, cursor-clip"
  "$mod, Q, killactive"
  "$mod SHIFT, Q, killwindow, active"
  "$mod, X, exec, hyprlock"

  # volume
  ", XF86AudioRaiseVolume, exec, pamixer -i 5"
  ", XF86AudioLowerVolume, exec, pamixer -d 5"
  ", XF86AudioMute, exec, pamixer -t"

  # focus
  "$mod, H, movefocus, l"
  "$mod, L, movefocus, r"
  "$mod, K, movefocus, u"
  "$mod, J, movefocus, d"

  # move windows
  "$mod SHIFT, H, movewindow, l"
  "$mod SHIFT, L, movewindow, r"
  "$mod SHIFT, K, movewindow, u"
  "$mod SHIFT, J, movewindow, d"

  # workspaces
  "$mod, 1, workspace, 1"
  "$mod, 2, workspace, 2"
  "$mod, 3, workspace, 3"
  "$mod, 4, workspace, 4"

  "$mod SHIFT, 1, movetoworkspace, 1"
  "$mod SHIFT, 2, movetoworkspace, 2"
  "$mod SHIFT, 3, movetoworkspace, 3"
  "$mod SHIFT, 4, movetoworkspace, 4"
]
