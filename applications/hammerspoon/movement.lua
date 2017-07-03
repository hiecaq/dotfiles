------------------------------------------------------------------------
--                              movement                              --
------------------------------------------------------------------------

local MMovement = {}
-- HYPER+H: left
MMovement.hfun = function()
    hs.eventtap.keyStroke({}, "Left")
end

-- HYPER+L: Right
MMovement.lfun = function()
    hs.eventtap.keyStroke({}, "Right")
end

-- HYPER+J: down
MMovement.jfun = function()
    hs.eventtap.keyStroke({}, "Down")
end

-- HYPER+hyper: Up
MMovement.kfun = function()
    hs.eventtap.keyStroke({}, "Up")
end

-- HYPER+F page down
MMovement.ffun = function()
    hs.eventtap.keyStroke({}, "pagedown")
end

-- HYPER+B - page up
MMovement.bfun = function()
    hs.eventtap.keyStroke({}, "pageup")
end

return MMovement
