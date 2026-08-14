---------------------
---- KEYBINDINGS ----
---------------------

local terminal    = "kitty"
local fileManager = "nautilus"
local browser     = "firefox"
local editor      = "code"

local menu        = "~/.config/rofi/launchers/type-2/launcher.sh || pkill rofi"
local screenshot  = "grim -o '$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')' - | wl-copy"
local emoji       = "rofimoji --selector-args='-theme /home/ariel/.config/rofi/launchers/type-2/style-1.rasi' --prompt='   ' --action='copy'"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

tvDisabled     = true

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + C", 
    hl.dsp.exec_cmd(terminal)
)
hl.bind(mainMod .. " + W", 
    hl.dsp.exec_cmd(browser)
)
hl.bind(mainMod .. " + SHIFT + W", 
    hl.dsp.exec_cmd(browser .. " -private-window")
)
hl.bind(mainMod .. " + D", 
    hl.dsp.exec_cmd(editor)
)
hl.bind(mainMod .. " + SHIFT + Q", 
    hl.dsp.window.close()
)
hl.bind(mainMod .. " + SHIFT + M", 
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", 
    hl.dsp.exec_cmd(fileManager)
)
hl.bind(mainMod .. " + F", 
    hl.dsp.window.float({ action = "toggle" })
)
hl.bind(mainMod .. " + R", 
    hl.dsp.exec_cmd(menu)
)
hl.bind(mainMod .. " + PERIOD",
    hl.dsp.exec_cmd(emoji)
)
hl.bind(mainMod .. " + P", 
    hl.dsp.window.pseudo()
)
hl.bind(mainMod .. " + J", 
    hl.dsp.layout("togglesplit")
)    -- dwindle only
hl.bind(mainMod .. " + G",
    hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"})
)
hl.bind(mainMod .. " + SHIFT + G",
    hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle"})
)

hl.bind(mainMod .. " + SHIFT + S", 
    hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy')
)
hl.bind(mainMod .. " + S", 
    hl.dsp.exec_cmd("grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name') - | wl-copy")
)
hl.bind(mainMod .. " + CTRL + S", 
    hl.dsp.exec_cmd("grim - | wl-copy")
)
hl.bind(mainMod .. " + SHIFT + CTRL + S", 
    hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | swappy -f -')
)


-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- move window around
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + minus",              hl.dsp.focus({ workspace = 11 }))
hl.bind(mainMod .. " + SHIFT + minus",      hl.dsp.window.move({ workspace = 11 }))
hl.bind(mainMod .. "+ equal",              hl.dsp.focus({ workspace = 12 }))
hl.bind(mainMod .. " + SHIFT + equal",      hl.dsp.window.move({ workspace = 12 }))


-- TV
local tvKey = "L"
hl.bind(mainMod .. " + " .. tvKey,            hl.dsp.focus({ workspace = "name:TV" }))
hl.bind(mainMod .. " + SHIFT + " .. tvKey,     hl.dsp.window.move({ workspace = "name:TV" }))
hl.bind(mainMod .. " + CONTROL + " .. tvKey, function() 
    tvDisabled = not tvDisabled
    if tvDisabled then
        hl.exec_cmd([[hyprctl eval 'hl.monitor({ output="HDMI-A-1", disabled=true })']])
        hl.exec_cmd("notify-send 'TV' 'Disabled Monitor' -i '/home/ariel/Pictures/icons/tv2white.png'")
    else
        hl.exec_cmd([[hyprctl eval 'hl.monitor({ output="HDMI-A-1", disabled=false, mode="3840x2160@60", position="6560x0", scale="1", vrr=2 })']])
        hl.exec_cmd("notify-send 'TV' 'Enabled Monitor' -i '/home/ariel/Pictures/icons/tv2white.png'")
    end
end)

-- Steam
local steamKey = "Z"
hl.bind(mainMod .. " + " .. steamKey, hl.dsp.focus({ workspace = "name:Steam" }))
hl.bind(mainMod .. " + SHIFT + " .. steamKey, hl.dsp.window.move({ workspace = "name:Steam" }))

-- Game
local gameKey = "X"
hl.bind(mainMod .. " + " .. gameKey, hl.dsp.focus({ workspace = "name:Game" }))
hl.bind(mainMod .. " + SHIFT + " .. gameKey, hl.dsp.window.move({ workspace = "name:Game" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + A",         hl.dsp.workspace.toggle_special("Scratch"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ workspace = "special:Scratch" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })