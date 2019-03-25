local util = require("util")
local wibox = require("wibox")
local gears = require("gears")

local fmt = "df -h %s | tail -n 1 | awk \'{ print $2\"\\t\"$4\"\\t\"$5 }\'"
local fields = { "total", "avail", "use%" }
local THIS = {}

function THIS.disk_space_usage(path, icon, timeout)
    local disk_space_widget = wibox.widget {
        {
            id = "inner",
            {
                id = "icon",
                text = icon,
                widget = wibox.widget.textbox
            },
            {
                id = "info",
                text = "0G/0G",
                widget = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.horizontal
        },
        -- bg = "#ff0000",
        widget = wibox.container.background,
        set_info = function(self, val)
            self.inner.info.text = val['avail'] .. "/" .. val['total']
        end,
    }
    local async_info = util.async_tsv(string.format(fmt, path), fields)
    gears.timer {
        timeout = timeout,
        call_now = true,
        autostart = true,
        callback = function()
            async_info:do_with(function(tsv)
                disk_space_widget.info = tsv
            end)
        end
    }
    return disk_space_widget
end

return THIS
