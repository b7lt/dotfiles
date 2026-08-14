-- Main Monitor (Center)
hl.workspace_rule({
    workspace = "1",
    monitor = "DP-1",
    persistent = true,
    default = true
})
hl.workspace_rule({
    workspace = "2",
    monitor = "DP-1",
    persistent = true,
})
hl.workspace_rule({
    workspace = "3",
    monitor = "DP-1",
    persistent = true,
})
hl.workspace_rule({
    workspace = "4",
    monitor = "DP-1",
    persistent = true,
})
hl.workspace_rule({
    workspace = "5",
    monitor = "DP-1",
    persistent = true
})

-- Left Monitor
hl.workspace_rule({
    workspace = "6",
    monitor = "DP-2",
    persistent = true,
    default = true
})
hl.workspace_rule({
    workspace = "7",
    monitor = "DP-2",
    persistent = true
})
hl.workspace_rule({
    workspace = "8",
    monitor = "DP-2",
    persistent = true
})
hl.workspace_rule({
    workspace = "9",
    monitor = "DP-2",
    persistent = true
})
hl.workspace_rule({
    workspace = "10",
    monitor = "DP-2",
    persistent = true
})

-- Right Monitor, Vertical
hl.workspace_rule({
    workspace = "11",
    monitor = "DP-3",
    persistent = true,
    default = true
})
hl.workspace_rule({
    workspace = "12",
    monitor = "DP-3",
    persistent = true
})

-- TV Workspace
hl.workspace_rule({
    workspace = "name:TV",
    monitor = "HDMI-A-1",
    persistent = true,
    default = true
})

-- Steam Workspace
hl.workspace_rule({
    workspace = "name:Steam",
    monitor = "DP-1",
    layout = "master",
    layout_opts = {
        orientation = "left",
    },
})

-- Game Workspace
hl.workspace_rule({
    workspace = "name:Game",
    monitor = "DP-1"
})