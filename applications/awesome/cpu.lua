local util = require("util")
local wibox = require("wibox")
local gears = require("gears")

local THIS = {}
local NAMES = {"user", "nice", "system", "idle", "iowait", "irq", "softirq", "steal", "guest", "guest_nice"}

function THIS.cpu_stat(icon, timeout, scale)
    local old_total = -1
    local old_idle = -1
    local cpustat_widget = wibox.widget { { id = "inner",
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
            local new_total = util.sum(val, NAMES)
            local new_idle = val["idle"] + val["iowait"]
            local result = (((new_total-old_total)-(new_idle-old_idle)) * scale) // (new_total-old_total)
            self.inner.info:add_value(result)
            old_total = new_total
            old_idle = new_idle
        end,
    }
    gears.timer {
        timeout = timeout,
        call_now = true,
        autostart = true,
        callback = function()
            local output = {}
            local stat = io.open("/proc/stat")
            for line in stat:lines() do
                local line = line:gmatch("cpu%s+(%d[%d%s]*)")()
                local values = line:gmatch("(%d+)%s*")
                for i,v in ipairs(NAMES) do
                    output[v] = tonumber(values())
                end
                break
            end
            stat:close()
            cpustat_widget.info = output
        end
    }
    return cpustat_widget
end

return THIS
