;==========================================================
;
;   To learn more about how to configure Polybar
;   go to https://github.com/jaagr/polybar
;
;   The README contains alot of information
;
;==========================================================

[colors]
background = ${xrdb:background:#222}
background-alt = #000000
;foreground = ${xrdb:color15:#f3f4f5}
foreground = #f3f4f5
foreground-alt = #777
primary = ${xrdb:color1}
secondary = ${xrdb:color1}
alert = ${xrdb:color1}

[bar/example]
monitor = ${env:MONITOR:eDP-1}
width = 100%
height = 24
;offset-x = 1%
;offset-y = 1%
radius = 0
fixed-center = true
background = ${colors.background}
foreground = ${colors.foreground}
line-size = 0
line-color = #f00
border-size = 0
border-color = #00000000
padding-left = 0
padding-right = 4
module-margin-left = 3
module-margin-right = 3
font-0 = Roboto:style=bold:pixelsize=10;2
font-1 = Font Awesome 5 Free:pixelsize=10;2
font-2 = Font Awesome 5 Free Solid:pixelsize=10;2
font-3 = Font Awesome 5 Brands:pixelsize=10;2
modules-left = i3
modules-center = date
modules-right = pulseaudio backlight-acpi bat0 bat1
tray-scale = 1
tray-position = right
tray-padding = 3
cursor-click = pointer
cursor-scroll = ns-resize

[module/xwindow]
type = internal/xwindow
label = %title:0:30:...%

[module/xkeyboard]
type = internal/xkeyboard
blacklist-0 = num lock
format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
format-prefix-underline = ${colors.secondary}
label-layout = %layout%
label-layout-underline = ${colors.secondary}
label-indicator-padding = 2
label-indicator-margin = 1
label-indicator-background = ${colors.secondary}
label-indicator-underline = ${colors.secondary}

[module/filesystem]
type = internal/fs
interval = 25
mount-0 = /
label-mounted = %{F#0a81f5}%mountpoint%%{F-}: %percentage_used%%
label-unmounted = %mountpoint% not mounted
label-unmounted-foreground = ${colors.foreground-alt}

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false
label-mode-padding = 2
label-mode-foreground = #FFF
label-mode-background = ${colors.primary}
; focused = Active workspace on focused monitor
label-focused = %index%
label-focused-background = ${colors.primary}
label-focused-underline = ${colors.primary}
label-focused-padding = 3
; unfocused = Inactive workspace on any monitor
label-unfocused = %index%
label-unfocused-padding = 3
; visible = Active workspace on unfocused monitor
label-visible = %index%
label-visible-background = ${self.label-focused-background}
label-visible-underline = ${self.label-focused-underline}
label-visible-padding = ${self.label-focused-padding}
; urgent = Workspace with urgency hint set
label-urgent = %index%
label-urgent-background = ${colors.alert}
label-urgent-padding = 3

[module/xbacklight]
type = internal/xbacklight
format = <ramp> <label>
label = %percentage%
ramp-0 = 
ramp-1 = 
ramp-2 = 
;bar-width = 10
;bar-indicator = I
;bar-indicator-foreground = #fff
;bar-fill = =
;bar-fill-foreground = ${colors.primary}
;bar-empty = =
;bar-empty-foreground = ${colors.foreground-alt}

[module/backlight-acpi]
;inherit = module/xbacklight
type = internal/backlight
card = intel_backlight
format = <ramp> <label>
label = %percentage%
ramp-0 = %{T3}
ramp-1 = %{T3}
ramp-2 = 
ramp-3 = %{T3}
ramp-4 = %{T3}

[module/cpu]
type = internal/cpu
interval = 2
format-prefix = " "
format-underline = ${colors.primary}
label = %percentage:2%%

[module/memory]
type = internal/memory
interval = 2
format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #4bffdc
label = %percentage_used%%

[module/wlan]
type = internal/network
interface = wlp4s0
interval = 2.0
format-connected = "%{A1:nm-connection-editor:}<label-connected>%{A}"
label-connected = "%{T3} %{T1}%essid%"
format-disconnected = "%{A1:nm-connection-editor:}<label-disconnected>%{A}"
label-disconnected = "%{T3} %{T1}disconnected"
label-disconnected-foreground = ${colors.foreground-alt}

[module/eth]
type = internal/network
interface = enp0s31f6
interval = 3.0
format-connected-underline = ${colors.primary}
format-connected-prefix = " "
format-connected-prefix-foreground = ${colors.foreground-alt}
label-connected = %local_ip%
format-disconnected =
;format-disconnected = <label-disconnected>
;format-disconnected-underline = ${self.format-connected-underline}
;label-disconnected = %ifname% disconnected
;label-disconnected-foreground = ${colors.foreground-alt}

[module/date]
type = internal/date
interval = 5
date = "%a %b %d"
date-alt = "%d/%m/%Y"
time = "%I:%M %p"
time-alt = "%I:%M %p"
format-prefix-foreground = ${colors.foreground-alt}
format-underline = ${colors.primary}
format-background = ${colors.primary}
format-padding = 3
label = "%{T3} %{T1}%date%     %{T3} %{T1}%time%"

[module/pulseaudio]
type = internal/pulseaudio
format-volume = <label-volume>
label-volume = %{T3} %{T1}%percentage%
;label-volume-foreground = ${root.foreground}
label-muted =  %percentage%
label-muted-foreground = ${colors.foreground-alt}

[module/bat0]
type = internal/battery
battery = BAT0
adapter = AC
full-at = 99
label-charging = %percentage%
label-discharging = %percentage%
label-full = %percentage%
format-charging = <animation-charging> <label-charging>
format-discharging = <ramp-capacity> <label-discharging>
format-full = <ramp-capacity> <label-full>
animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-3 = 
animation-charging-4 = 
animation-charging-framerate = 500
ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 

[module/bat1]
type = internal/battery
battery = BAT1
adapter = AC
full-at = 99
label-charging = %percentage%
label-discharging = %percentage%
label-full = %percentage%
format-charging = <animation-charging> <label-charging>
format-discharging = <ramp-capacity> <label-discharging>
format-full = <ramp-capacity> <label-full>
animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-3 = 
animation-charging-4 = 
animation-charging-framerate = 500
ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 

[module/temperature]
type = internal/temperature
thermal-zone = 0
warn-temperature = 60
format = <ramp> <label>
format-underline = ${xrdb.primary}
format-warn = <ramp> <label-warn>
format-warn-underline = ${self.format-underline}
label = %temperature-c%
label-warn = %temperature-c%
label-warn-foreground = ${colors.secondary}
ramp-foreground = ${colors.foreground-alt}

[global/wm]
margin-top = 5
margin-bottom = 5

; vim:ft=dosini
