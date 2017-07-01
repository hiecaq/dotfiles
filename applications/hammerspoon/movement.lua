------------------------------------------------------------------------
--                              movement                              --
------------------------------------------------------------------------

-- HYPER+H: left
hfun = function()
    hs.eventtap.keyStroke({}, "Left")
    hyper.triggered = true
end
-- hyper:bind({}, 'h', hfun, nil, hfun)

-- HYPER+L: Right
lfun = function()
    hs.eventtap.keyStroke({}, "Right")
    hyper.triggered = true
end
-- hyper:bind({}, 'l', lfun, nil, lfun)

-- HYPER+J: down
jfun = function()
    hs.eventtap.keyStroke({}, "Down")
    hyper.triggered = true
end
-- hyper:bind({}, 'j', jfun, nil, jfun)

-- HYPER+hyper: Up
kfun = function()
    hs.eventtap.keyStroke({}, "Up")
    hyper.triggered = true
end
-- hyper:bind({}, 'k', kfun, nil, kfun)

-- HYPER+F page down
hyper:bind({}, "f", function()
    hs.eventtap.keyStroke({}, "pagedown")
    hyper.triggered = true
end)

-- HYPER+B - page up
hyper:bind({}, "b", function()
    hs.eventtap.keyStroke({}, "pageup")
    hyper.triggered = true
end)

