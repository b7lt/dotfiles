require("keybinds")
require("monitors")
require("workspaces")
require("window_rules")
require("appearance")

hl.config({
  general = {
    -- allow_tearing = true
  }
})

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
local terminal    = "kitty"

hl.on("hyprland.start", function () 
  hl.exec_cmd(terminal)
  -- Network and Bluetooth are handled by Waybar modules/menus.
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("blueman-applet")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
  hl.exec_cmd("hyprctl setcursor Adwaita 24")
--   hl.exec_cmd("hyprctl setcursor 'Phingers Cursors (dark)' 24")
  hl.exec_cmd("[workspace 11 silent] spotify-launcher")
  hl.exec_cmd("[workspace 11 silent] discord")
--   hl.exec_cmd("dunst")
--   hl.exec_cmd("waybar & hyprpaper")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- hl.env("HYPRCURSOR_THEME", "Phingers Cursors (dark)")
-- hl.env("XCURSOR_THEME", "Phingers Cursors (dark)")
hl.env("HYPRCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_THEME", "Adwaita")


hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
-- hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("gtk-application-prefer-dark-theme", "true")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("XDG_MENU_PREFIX", "arch- kbuildsycoca6")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


----------------
----  MISC  ----
----------------

hl.config({
    -- render = {
    --     direct_scanout = 1
    -- },
    misc = {
        disable_splash_rendering = true,
        disable_hyprland_logo   = true
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        accel_profile = "flat",

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
-- hl.device({
--     name        = "epic-mouse-v1",
--     sensitivity = -0.5,
-- })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})


hl.config({
    master = {
        mfact = 0.60,
        orientation = "left",

        -- New tiled windows go into the right-side slave stack
        new_status = "slave",

        -- New slaves go below existing slaves
        new_on_top = false,
    },
})

hl.config({
    input = {
        tablet = {
            output = "DP-1"
        }
    }
})