-- All Steam windows float unless overridden below.
hl.window_rule({
    match = { class = "^steam$" },
    float = true,
    workspace = "name:Steam"
})
-- These two are unambiguously tiled.
hl.window_rule({
    match = {
        class = "^steam$",
        initial_title = "^Steam$",
    },
    tile = true,
    workspace = "name:Steam"
})
hl.window_rule({
    match = {
        class = "^steam$",
        initial_title = "^Friends List$",
    },
    tile = true,
    workspace = "name:Steam"
})
-- Chats with the recognizable CEF initial title.
hl.window_rule({
    match = {
        class = "^steam$",
        initial_title = "^about:blank.*createflags=18.*$",
    },
    tile = true,
    workspace = "name:Steam"
})
-- Chat fallback
hl.window_rule({
    match = {
        class = "^steam$",
        initial_title = "^.* [+] [1-9][0-9]* Chats?$",
    },
    tile = true,
    workspace = "name:Steam"
})
-- Handle other chats
hl.on("window.open", function(w)
    if w == nil or w.class ~= "steam" then
        return
    end

    -- Steam / Friends List were already handled by rules.
    if w.title == "Steam" or w.title == "Friends List" then
        return
    end

    -- Steam's default chat dimensions in your setup.
    if w.size.x == 740 and w.size.y == 650 then
        hl.dispatch(hl.dsp.window.float({
            action = "unset",
            window = w,
        }))
    end
end)

-- Game Rules
hl.window_rule({
  match = { class = "tf_linux64" }, 
  immediate = true,
  workspace = "name:Game silent",
  opacity = "1.0 override"
})
hl.window_rule({
  match = { class = "^(steam_app_.*)$"},
  immediate = true,
  workspace = "name:Game silent",
  opacity = "1.0 override"
})
hl.window_rule({
  match = { class = "gamescope" },
  immediate = true,
  workspace = "name:Game silent",
  opacity = "1.0 override"
})


hl.window_rule{
    match = { class = "steam_app_3557932613" },
    rounding = 0
    -- decorate = false 
}

-- Move Rules
hl.window_rule({
    name  = "move-discord",
    match = { class = "discord" },

    workspace = "11",
    no_initial_focus = true,
    opacity = "1.0 override"
    -- size      = {"monitor_w", "monitor_h*(2/3)"}
})
hl.window_rule({
    name  = "move-spotify",
    match = { class = "spotify" },

    workspace = "11",
    no_initial_focus = true,
    -- size      = {"monitor_w", "monitor_h*(1/3)"},
    -- position  = {"0", "monitor_h*(1/3)"}
})