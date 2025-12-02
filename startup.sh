nmcli device wifi connect Jb password {password}
sleep 2 

# Set workspace 1 on external monitor (HDMI-1) and workspace 2 on laptop monitor (eDP-1)
# Adjust output names (HDMI-1/eDP-1) with xrandr if they're different
i3-msg 'workspace 1; move workspace to output HDMI-1'
i3-msg 'workspace 2; move workspace to output eDP-1'

# Position HDMI above laptop screen
xrandr --output HDMI-1 --left-of eDP-1
sleep 1


# Launch apps in workspace 2 (secondary/laptop screen)
i3-msg 'workspace 2'
sleep 3 
discord-proxy &
konsole &
sleep 5

# Launch apps in workspace 1 (primary/external screen)
i3-msg 'workspace 1'
sleep 3
viv &

nmcli con up sstp
