local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local bat = require('battery')
local meminfo = require('memory')
local cpustat = require('cpu')
local thermal = require('thermal')
local disk = require('disk')
local net = require('net')
local naughty = require("naughty")

beautiful.init(gears.filesystem.get_xdg_config_home() .. "awesome/theme.lua")

-- Wallpaper {{{
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)
-- Wallpaper END }}}

-- Variables {{{
-- This is used later as the default terminal and editor to run.
local terminal = awful.myglobal.terminal
local editor = awful.myglobal.editor
local editor_cmd = awful.myglobal.editor_cmd
local modkey = awful.myglobal.modkey
-- Variables END }}}

local THIS = {}

-- Create a textclock widget
local mytextclock = wibox.widget.background(wibox.widget.textclock(), beautiful.bg_general)


local function stylized(wid)
    if wid == nil then
        return nil
    end
    bgw = wibox.container.background(wid, beautiful.bg_general)
    mw = wibox.container.margin(bgw, 8, 8, 0, 0, beautiful.bg_general,false)
    mw = wibox.container.margin(mw, 1, 1, 1, 1, beautiful.fg_normal,false)
    return mw
end

function THIS.setup(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    local tag_names = {"", "", "", ""}
    local l = awful.layout.suit
    local tag_layouts = { l.spiral, l.max.fullscreen, l.max, l.tile }
    awful.tag(tag_names, s, tag_layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Taglist {{{
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        spacing = 10,
        layout = wibox.layout.fixed.horizontal,
    }
    s.mytaglist:set_visible(true)
    -- TagList END }}}

    -- Wibar {{{
    s.mywibox = awful.wibar {
            position = "top",
            screen = s,
            width = s.geometry.width - beautiful.general_spacing * 2
    }
    s.mywibox.y = s.mywibox.y + beautiful.wibar_padding * 2
    s.mywibox:struts {
        top = s.mywibox:struts().top + beautiful.wibar_padding * 2
    }
    -- Wibar END }}}

    -- layout popup {{{
    -- copy & paste & changed from https://gist.github.com/Elv13/b679fe3cb100cd63a7082cc808d316b8
    s.ll = awful.widget.layoutlist {
        screen = s,
        spacing = 8,
        base_layout = wibox.widget {
            spacing         = 5,
            forced_num_cols = 5,
            layout          = wibox.layout.grid.vertical,
        },
        widget_template = {
            {
                {
                    id            = 'icon_role',
                    forced_height = 48,
                    forced_width  = 48,
                    widget        = wibox.widget.imagebox,
                },
                margins = 8,
                widget  = wibox.container.margin,
            },
            id              = 'background_role',
            forced_width    = 48,
            forced_height   = 48,
            shape           = gears.shape.rounded_rect,
            widget          = wibox.container.background,
        },
    }

    s.layout_popup = awful.popup {
        widget = wibox.widget {
            s.ll,
            margins = 8,
            widget  = wibox.container.margin,
            screen  = s,
        },
        border_color = beautiful.border_color,
        border_width = beautiful.border_width,
        placement    = awful.placement.centered,
        ontop        = true,
        visible      = false,
        bg           = beautiful.bg_general,
        screen = s,
    }
    -- layout popup END }}}


    -- Add widgets to the wibox
    s.mywibox:setup {
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 20,
            stylized(s.mytaglist),
            stylized(disk.disk_space_usage("/", "", 600)),
            stylized(disk.disk_space_usage("$HOME", "", 600)),
            s.mypromptbox,
        },
        nil,
        wibox.widget {
            { -- Right widgets
                stylized(wibox.widget.systray()),
                stylized(thermal.thermal_measure("thermal_zone10", '﨏', 30, 100, 5)),
                stylized(cpustat.cpu_stat('﬙', 5, 1000)),
                stylized(meminfo.memory_usage('', 5, 1000)),
                stylized(net.net('wlp2s0', "祝","", 10)),
                stylized(bat.battery('BAT0', 10)),
                stylized(mytextclock),
                spacing = 20,
                layout = wibox.layout.fixed.horizontal,
            },
            -- bg = beautiful.bg_general,
            widget = wibox.container.background,
        },
        layout = wibox.layout.align.horizontal,
    }
end

client.connect_signal("focus", function(c)
    awful.screen.focus(c.screen)
    naughty.notify {
        position = "top_middle",
        title = gears.string.split(c.name,'\n')[1],
        -- message = " hello ",
        timeout = 0.5,
        height = beautiful.height_general
    }
end)

return THIS

-- vim: foldenable:foldmethod=marker
