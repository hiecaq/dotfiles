------------------------------------------------------------------------
--                         Windows Management                         --
------------------------------------------------------------------------

local MWManager = {}

local grid = require "hs.grid"
local geo = require "hs.geometry"
local win = require "hs.window"
local hints = require "hs.hints"
local scn = require "hs.screen"

grid.setMargins('0, 0')
grid.setGrid('4x4')

-------------------------------
--  window resize functions  --
-------------------------------

-- help function to solve the edge due to the limitation of API
-- In my case, the Dock is located at left
local function fixEdge(win) 
    -- local r = win:size()
    -- r.w = r.w + 4
    -- win:move(hs.geometry.point(-4, 0))
    -- win:setSize(r)
end

-- help function to build window resize functions
local function set(cell, name)
    return function()
        local wn = win.focusedWindow()
        local screen = name ~= nil and wn:screen()[name](wn:screen()) or wn:screen()
        grid.set(wn, cell, screen)
        if cell.x == 0
            and screen == scn.primaryScreen() then
            fixEdge(wn)
        end
    end
end

MWManager.setToLeft = set(geo(0,0,2,4), nil)
MWManager.setToRight = set(geo(2,0,2,4), nil)
MWManager.setToTop = set(geo(0,0,4,2), nil)
MWManager.setToBottom = set(geo(0,2,4,2), nil)
MWManager.maximize = set(geo(0,0,4,4), nil)
MWManager.setToUpperLeft = set(geo(0,0,2,2), nil)
MWManager.setToUpperRight = set(geo(2,0,2,2), nil)
MWManager.setToLowerLeft = set(geo(0,2,2,2), nil)
MWManager.setToLowerRight = set(geo(2,2,2,2), nil)
MWManager.setToCenter = set(geo(1,1,2,2), nil)

MWManager.toggleFullScreen = function ()
    local wn = win.focusedWindow()
    wn:toggleFullScreen()
end

MWManager.setToEastScreen = set(geo(1,1,2,2), "toEast")
MWManager.setToWestScreen = set(geo(1,1,2,2), "toWest")
MWManager.setToNorthScreen = set(geo(1,1,2,2), "toNorth")
MWManager.setToSouthScreen = set(geo(1,1,2,2), "toSouth")

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
