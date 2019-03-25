local util = require("util")
local wibox = require("wibox")
local gears = require("gears")

local THIS = {}

function THIS.memory_usage(icon, timeout, scale)
    local meminfo_widget = wibox.widget { { id = "inner",
            {
                id = "icon",
                text = icon,
                widget = wibox.widget.textbox
            },
            {
                id = "info",
                max_value = scale,
                step_width = 2,
                widget = wibox.widget.graph,
            },
            layout = wibox.layout.fixed.horizontal
        },
        widget = wibox.container.background,
        set_info = function(self, val)
            self.inner.info:add_value(((val['MemTotal'] - val['MemAvailable']) * scale) // val['MemTotal'])
        end,
    }
    gears.timer {
        timeout = timeout,
        call_now = true,
        autostart = true,
        callback = function()
            local count = 0
            local output = {}
            local meminfo = io.open("/proc/meminfo")
            for line in meminfo:lines() do
                local k, v = line:gmatch("([%a]+):%s+(%d+)%s+")()
                output[k] = tonumber(v)
                count = count + 1
                if (count == 3) then
                    break
                end
            end
            meminfo:close()
            meminfo_widget.info = output
        end
    }
    return meminfo_widget
end

return THIS
