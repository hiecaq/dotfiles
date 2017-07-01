------------------------------------------------------------------------
--                         Windows Management                         --
------------------------------------------------------------------------

local MWManager = {}

local fixEdge = function(win, max) 
    local r = win:size()
    r.w = r.w + 4
    r.h = max.h
    win:move(hs.geometry.point(-4, 0))
    win:setSize(r)
end

MWManager.Cmfun = function()
    local win = hs.window.focusedWindow()
    local max = win:screen():frame()
    local f = win:frame()
    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
    fixEdge(win, max)
end

MWManager.Chfun = function()
    local win = hs.window.focusedWindow()
    local max = win:screen():frame()
    local f = win:frame()
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
    fixEdge(win, max)
end


MWManager.Clfun = function()
    local win = hs.window.focusedWindow()
    local max = win:screen():frame()
    local f = win:frame()
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end

return MWManager
