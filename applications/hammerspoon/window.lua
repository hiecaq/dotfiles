------------------------------------------------------------------------
--                         Windows Management                         --
------------------------------------------------------------------------

local MWManager = {}

local grid = require "hs.grid"
local geo = require "hs.geometry"
local win = require "hs.window"
local hints = require "hs.hints"

grid.setMargins('0, 0')
grid.setGrid('2x2')

-------------------------------
--  window resize functions  --
-------------------------------

-- help function to solve the edge due to the limitation of API
-- In my case, the Dock is located at left
local function fixEdge(win) 
    local r = win:size()
    r.w = r.w + 4
    win:move(hs.geometry.point(-4, 0))
    win:setSize(r)
end

-- help function to build window resize functions
local function set(cell)
    return function()
        local wn = win.focusedWindow()
        grid.set(wn, cell, wn:screen())
        if cell.x == 0 then
            fixEdge(wn)
        end
    end
end

MWManager.setToLeft = set(geo(0,0,1,2))
MWManager.setToRight = set(geo(1,0,1,2))
MWManager.setToTop = set(geo(0,0,2,1))
MWManager.setToBottom = set(geo(0,1,2,1))
MWManager.maximize = set(geo(0,0,2,2))
MWManager.setToUpperLeft = set(geo(0,0,1,1))
MWManager.setToUpperRight = set(geo(1,0,1,1))
MWManager.setToLowerLeft = set(geo(0,1,1,1))
MWManager.setToLowerRight = set(geo(1,1,1,1))

------------------------------
--  window focus functions  --
------------------------------

MWManager.focusEast = function ()
    local wn = win.focusedWindow()
    wn:focusWindowEast()
end

MWManager.focusWest = function ()
    local wn = win.focusedWindow()
    wn:focusWindowWest()
end
MWManager.focusNorth = function ()
    local wn = win.focusedWindow()
    wn:focusWindowNorth()
end

MWManager.focusSouth = function ()
    local wn = win.focusedWindow()
    wn:focusWindowSouth()
end

--------------------
--  window hints  --
--------------------

hints.style = "vimperator"

MWManager.hint = function ()
    hints.windowHints()
end

return MWManager
