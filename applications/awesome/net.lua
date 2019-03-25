local util = require("util")
local wibox = require("wibox")
local gears = require("gears")

local THIS = {}

function calc_speed(old, new, time)
    return (new - old) / time
end

function THIS.net(name, tx_symbol, rx_symbol, timeout)
    local old_tx_bytes = -1;
    local old_rx_bytes = -1;
    local net_widget = wibox.widget {
        {
            id = "inner",
            {
                id = "tx",
                text = "0MB/s",
                widget = wibox.widget.textbox
            },
            spacing = 10,
            {
                id = "rx",
                text = "0MB/s",
                widget = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.horizontal
        },
        widget = wibox.container.background,
        set_info = function(self, val)
            local new_tx_bytes = tonumber(val.tx_bytes:match("^%s*(.-)%s*$"))
            local new_rx_bytes = tonumber(val.rx_bytes:match("^%s*(.-)%s*$"))
            self.inner.tx.text = string.format("%9s".. tx_symbol, util.byte_repr(calc_speed(old_tx_bytes, new_tx_bytes, timeout)) .. "/s")
            self.inner.rx.text = string.format(rx_symbol .. "%-9s", util.byte_repr(calc_speed(old_rx_bytes, new_rx_bytes, timeout)) .. "/s")
            old_rx_bytes = new_rx_bytes
            old_tx_bytes = new_tx_bytes
        end,
    }
    gears.timer {
        timeout = timeout,
        call_now = true,
        autostart = true,
        callback = function()
            local info = util.dirtable('/sys/class/net/' .. name .. "/statistics", {'tx_bytes', 'rx_bytes'})
            net_widget.info = info
        end
    }
    return net_widget
end

return THIS

-- vim: foldenable:foldmethod=marker
