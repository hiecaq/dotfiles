local util = require("util")
local wibox = require("wibox")
local gears = require("gears")

local THIS = {}

function THIS.thermal_measure(name, icon, min, max, timeout)
    local thermal_widget = wibox.widget { { id = "inner",
            {
                id = "icon",
                text = icon,
                widget = wibox.widget.textbox
            },
            {
                id = "info",
                max_value = max,
                min_value = min,
                step_width = 2,
                widget = wibox.widget.graph,
            },
            layout = wibox.layout.fixed.horizontal
        },
        widget = wibox.container.background,
        set_info = function(self, val)
            local thermal = tonumber(val.temp:match("^%s*(.-)%s*$")) // 1000
            self.inner.info:add_value(thermal)
        end,
    }
    gears.timer {
        timeout = timeout,
        call_now = true,
        autostart = true,
        callback = function()
            local info = util.dirtable('/sys/class/thermal/' .. name, {"temp"})
            thermal_widget.info = info
        end
    }
    return thermal_widget
end

return THIS
