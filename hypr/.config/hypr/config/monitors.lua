-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly
-- hl.monitor({
--     output    = "MONITOR1",
--     mode      = "1920x1080@60",
--     position  = "0x0",
--     scale     = "1",
-- })

hl.monitor({
    output   = MONITOR1,
    mode     = "2560x1440@239.97",
    position = "2560x0",
    scale    = "1",
    -- vrr      = 2
})
hl.monitor({
    output   = MONITOR2,
    mode     = "2560x1440@239.97",
    position = "0x0",
    scale    = "1",
    -- vrr      = 2
})
hl.monitor({
    output      = MONITOR3,
    mode        = "2560x1440@59.95100",
    position    = "5120x-380",
    scale       = "1",
    transform   = 3,
    -- vrr         = 2
})
hl.monitor({
    output       = TV1,
    mode         = "3840x2160@60",
    position     = "6560x0",
    disabled     = true,
    -- vrr           = 2
})