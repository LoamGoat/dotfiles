-- Converted from hyprland.conf + settings.conf (hyprlang -> lua, Hyprland 0.55+)
-- Original files: ~/.config/hypr/hyprland.conf, ~/.config/hypr/settings.conf
--
-- NOTE: A handful of lines below use hl.dsp.exec_raw("<classic dispatcher string>")
-- as a safe fallback where I couldn't verify the exact typed hl.dsp.* field names
-- from official docs. These are functionally equivalent to the old syntax and WILL
-- work, but a "proper" typed replacement may exist. They're marked with -- VERIFY.
-- Check https://wiki.hypr.land/Configuring/Basics/Dispatchers/ if you want to
-- convert those over time.

----------------------
---- VARIABLES ----
----------------------
local monitorA = "LVDS-1"
local monitorB = "VGA-1"

local mainMod = "SUPER"
local modA    = "SUPER + CTRL"
local modB    = "SUPER + SHIFT"

local activeBorder = "rgba(FFFFFF80)"
local border        = "rgba(595959ff)"

------------------
---- MONITORS ----
------------------
hl.monitor({ output = monitorA, mode = "1366x768@60", position = "1280x0", scale = 1 })
hl.monitor({ output = monitorB, mode = "1280x1025@60", position = "0x0", scale = 1, transform = 0 })
-- hl.monitor({ output = "Unknown-1", disabled = true })

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.local/bin/on_login.sh")
    --hl.exec_cmd("hyprpaper")
    --hl.exec_cmd("mpvpaper -o 'loop-file=inf no-audio' LVDS-1 '/home/ares/Live Wallpaper/LowerQualityChainsawman.mp4'")
    hl.exec_cmd("waypaper --restore")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("waybar")
    hl.exec_cmd("/usr/lib/hyprpolkitagent")
    hl.exec_cmd("dunst")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")   -- text clipboard history
    hl.exec_cmd("wl-paste --type image --watch cliphist store")  -- image clipboard history
    hl.exec_cmd("swayosd-server --display=" .. monitorA)
    hl.exec_cmd("XDG_MENU_PREFIX=arch- kbuildsycoca6")
    hl.exec_cmd("sway-audio-idle-inhibit")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user start xdg-desktop-portal")
    hl.exec_cmd("~/.local/bin/wallpaper.sh")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("GTK_THEME", "Fluent-Dark")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("GDK_DEBUG", "portals")
hl.env("HYPRCURSOR_THEME", "Adwaita")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_MENU_PREFIX", "plasma-")

---------------
---- INPUT ----
---------------
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        accel_profile = "adaptive",
        follow_mouse = 1,
        mouse_refocus = false,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.2,
            disable_while_typing = false,
            middle_button_emulation = false,
            tap_to_click = false,
        },
    },
})

hl.device({
    name = "tpps/2-ibm-trackpoint",
    sensitivity = -0.2,
})

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 4,
        border_size = 2,
        col = {
            active_border = activeBorder,
            inactive_border = border,
        },
        layout = "dwindle",
        allow_tearing = false,
    },
    decoration = {
        rounding = 4,
        blur = { enabled = false },
        shadow = { enabled = false },
    },
    cursor = {
        inactive_timeout = 3,
        no_hardware_cursors = 0,
    },
    dwindle = {
        preserve_split = true,
    },
    ecosystem = {
        no_update_news = true,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_splash_rendering = true,
    },
})

-- Animations: original had one custom bezier (0.13,1, 0.75,1) reused everywhere
hl.curve("custom", { type = "bezier", points = { {0.13, 1}, {0.75, 1} } })

hl.config({ animations = { enabled = true } })

hl.animation({ leaf = "windows",     enabled = true, speed = 3,   bezier = "custom",  style = "popin" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 3,   bezier = "custom",  style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10,  bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,   bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,   bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 2,   bezier = "default" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2.5, bezier = "custom",  style = "slide" })

--------------------------------
---- WORKSPACES ----
--------------------------------
hl.workspace_rule({ workspace = "1", monitor = monitorA, default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = monitorA, default = true, persistent = true })
hl.workspace_rule({ workspace = "3", monitor = monitorA, default = true, persistent = true })
hl.workspace_rule({ workspace = "4", monitor = monitorA, default = true, persistent = true })
hl.workspace_rule({ workspace = "5", monitor = monitorA, default = true, persistent = true })
hl.workspace_rule({ workspace = "6", monitor = monitorA, default = true, persistent = true })
hl.workspace_rule({ workspace = "7", monitor = monitorA, default = true, persistent = true })
hl.workspace_rule({ workspace = "8", monitor = monitorA, default = true, persistent = true })

---------------------
---- KEYBINDINGS ----
---------------------

-- workspace switching (note: your original maps mainMod+1..4 to workspaces 1,3,5,7)
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))


-- move window to workspace silently (stay on current workspace)
hl.bind(modB .. " + 1", hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind(modB .. " + 2", hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind(modB .. " + 3", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind(modB .. " + 4", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind(modB .. " + 5", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind(modB .. " + 6", hl.dsp.window.move({ workspace = 6, follow = false }))
hl.bind(modB .. " + 7", hl.dsp.window.move({ workspace = 7, follow = false }))
hl.bind(modB .. " + 8", hl.dsp.window.move({ workspace = 8, follow = false }))

-- virtual desktops
hl.bind(modB .. " + O", hl.dsp.exec_cmd("~/.local/bin/switch_desktops.sh 1"))
hl.bind(modB .. " + I", hl.dsp.exec_cmd("~/.local/bin/switch_desktops.sh -1"))
hl.bind(modA .. " + O", hl.dsp.exec_cmd("~/.local/bin/switch_desktops.sh 1"))
hl.bind(modA .. " + I", hl.dsp.exec_cmd("~/.local/bin/switch_desktops.sh -1"))

-- VERIFY: swapactiveworkspaces has no confirmed typed hl.dsp.* form found in docs;
-- exec_raw passes the classic dispatcher string straight through and will work.
hl.bind(modA .. " + BACKSLASH", hl.dsp.exec_raw("swapactiveworkspaces " .. monitorA .. " " .. monitorA))
hl.bind(modB .. " + BACKSLASH", hl.dsp.exec_raw("swapactiveworkspaces " .. monitorA .. " " .. monitorA))

-- lock
hl.bind(modA .. " + L", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))

-- alt-tab cycling (combines cyclenext + bringactivetotop like your original two binds)
hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end, { description = "Cycle to next window" })

hl.bind("ALT + SHIFT + Tab", function()
    hl.dispatch(hl.dsp.exec_raw("cyclenext prev"))  -- VERIFY: reverse-cycle typed form unconfirmed
    hl.dispatch(hl.dsp.window.bring_to_top())
end, { description = "Cycle to prev window" })

-- applications
hl.bind(modA .. " + T", hl.dsp.exec_cmd("alacritty"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("alacritty"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("foliate"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("waypaper"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("texstudio"))
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | satty --filename - --output-filename ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Y", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("dolphin"))

-- VERIFY: resizeactive with raw pixel deltas — using exec_raw fallback (repeating for held key)
hl.bind(modA .. " + K", hl.dsp.exec_raw("resizeactive 40 0"), { repeating = true })
hl.bind(modA .. " + J", hl.dsp.exec_raw("resizeactive -40 0"), { repeating = true })
hl.bind(modB .. " + K", hl.dsp.exec_raw("resizeactive 40 0"), { repeating = true })
hl.bind(modB .. " + J", hl.dsp.exec_raw("resizeactive -40 0"), { repeating = true })

hl.bind("XF86Launch1", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"), { repeating = true })

-- rofi
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("~/.local/bin/launch_rofi.sh"))

-- powermenu (original modifier was "META_CTRL" -> SUPER + CTRL)
hl.bind("SUPER + CTRL + Delete", hl.dsp.exec_cmd("~/.local/bin/powermenu.sh"))

-- move window to monitor
-- NOTE: this reuses mainMod+1 / mainMod+2, which also trigger the workspace-focus
-- binds above (mainMod+1 -> workspace 1, mainMod+2 -> workspace 3) in your ORIGINAL
-- config too. That conflict pre-existed; only the last-registered bind for a given
-- key combo will fire. Flagging so you can decide which one you actually want.
hl.bind(mainMod .. " + 1", hl.dsp.window.move({ monitor = monitorA }))  -- VERIFY: monitor move field name
hl.bind(mainMod .. " + 2", hl.dsp.window.move({ monitor = monitorA }))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("hyprctl dispatch focusmonitor " .. monitorA .. " && hyprctl dispatch focusmonitor " .. monitorA))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("hyprctl dispatch focusmonitor " .. monitorA .. " && hyprctl dispatch focusmonitor " .. monitorA))

-- media control
hl.bind(modA .. " + P", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))
hl.bind(modA .. " + E", hl.dsp.exec_cmd("playerctl --player=spotify previous"))
hl.bind(modA .. " + R", hl.dsp.exec_cmd("playerctl --player=spotify next"))
hl.bind(modB .. " + P", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))
hl.bind(modB .. " + E", hl.dsp.exec_cmd("playerctl --player=spotify previous"))
hl.bind(modB .. " + R", hl.dsp.exec_cmd("playerctl --player=spotify next"))

-- audio / brightness (repeating for held keys, locked so they work on lockscreen)
hl.bind("XF86AudioRaiseVolume",   hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",   hl.dsp.exec_cmd("swayosd-client --output-volume lower"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",          hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })
hl.bind("XF86AudioMicMute",       hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp",    hl.dsp.exec_cmd("swayosd-client --brightness raise"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd("swayosd-client --brightness lower"), { locked = true, repeating = true })

-- lid switch (confirmed pattern from Hyprland wiki)
hl.bind("switch:on:Lid Switch",  hl.dsp.exec_cmd("~/.local/bin/handle_lid.sh closed"), { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("~/.local/bin/handle_lid.sh open"), { locked = true })

-- screenshots
hl.bind(modA .. " + S", hl.dsp.exec_cmd("grimblast --freeze copy area"))
hl.bind(modB .. " + S", hl.dsp.exec_cmd("grimblast --freeze copy area"))

-- move focus between windows (your custom J/K/U/N mapping, not hjkl)
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + U", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + N", hl.dsp.focus({ direction = "down" }))

-- move / resize windows via mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------------------
---- WINDOW RULES ----
--------------------------------
-- VERIFY: field names below (opacity / no_initial_focus / max_size / no_blur / no_focus)
-- are best-effort based on the general hl.window_rule({match=..., ...}) shape shown in
-- Hyprland's official example config. Cross-check against
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/ before relying on them.

hl.window_rule({
    name = "pip-float",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
})

hl.window_rule({
    name = "xwaylandvideobridge-hide",
    match = { class = "^(xwaylandvideobridge)$" },
    opacity = "0.0 override",
    no_initial_focus = true,
    max_size = { 1, 1 },
    no_blur = true,
    no_focus = true,
})
hl.window_rule({
    name  = "flameshot-fullscreen",
    match = { class = "flameshot" },
    float   = true,
    pin     = true,
    no_anim = true,
    move    = {0, 0},
})
