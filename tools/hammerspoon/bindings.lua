------------------------------------------------------------------------
--                             Hyper Key                              --
------------------------------------------------------------------------
-- Get from https://github.com/lodestone/hyper-hacks

-- A global variable for the Hyper Mode
hyper = hs.hotkey.modal.new({}, "F17")
-- 
-- -- HYPER+L: Open news.google.com in the default browser
-- lfun = function()
--   news = "app = Application.currentApplication(); app.includeStandardAdditions = true; app.doShellScript('open http://news.google.com')"
--   hs.osascript.javascript(news)
--   hyper.triggered = true
-- end
-- hyper:bind('', 'l', nil, lfun)
-- 
-- -- HYPER+M: Call a pre-defined trigger in Alfred 3
-- mfun = function()
--   cmd = "tell application \"Alfred 3\" to run trigger \"emoj\" in workflow \"com.sindresorhus.emoj\" with argument \"\""
--   hs.osascript.applescript(cmd)
--   hyper.triggered = true
-- end
-- hyper:bind({}, 'm', nil, mfun)
-- 
-- -- HYPER+E: Act like ⌃e and move to end of line.
-- efun = function()
--   hs.eventtap.keyStroke({'⌃'}, 'e')
--   hyper.triggered = true
-- end
-- hyper:bind({}, 'e', nil, efun)
-- 
-- -- HYPER+A: Act like ⌃a and move to beginning of line.
-- afun = function()
--   hs.eventtap.keyStroke({'⌃'}, 'a')
--   hyper.triggered = true
-- end
-- hyper:bind({}, 'a', nil, afun)

-----------------------
--  cursor movement  --
-----------------------

-- HYPER+H: left
hfun = function()
    hs.eventtap.keyStroke({}, "Left")
end
hyper:bind({}, 'h', hfun, nil, hfun)

-- HYPER+L: Right
lfun = function()
    hs.eventtap.keyStroke({}, "Right")
end
hyper:bind({}, 'l', lfun, nil, lfun)

-- HYPER+J: down
jfun = function()
    hs.eventtap.keyStroke({}, "Down")
end
hyper:bind({}, 'j', jfun, nil, jfun)

-- HYPER+hyper: Up
kfun = function()
    hs.eventtap.keyStroke({}, "Up")
end
hyper:bind({}, 'k', kfun, nil, kfun)

-- HYPER+F page down
hyper:bind({}, "f", function()
    hs.eventtap.keyStroke({}, "pagedown")
end)

-- HYPER+B - page up
hyper:bind({}, "b", function()
    hs.eventtap.keyStroke({}, "pageup")
end)

--------------------------
--  Windows Management  --
--------------------------

-- help method that fix the edge caused by dock on left
fixEdge = function(win, max) 
    local r = win:size()
    r.w = r.w + 4
    r.h = max.h
    win:move(hs.geometry.point(-4, 0))
    win:setSize(r)
end

Cmfun = function()
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
hyper:bind({"Ctrl"}, "M", nil, Cmfun)

Chfun = function()
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
hyper:bind({"Ctrl"}, "H", nil, Chfun)


Clfun = function()
    local win = hs.window.focusedWindow()
    local max = win:screen():frame()
    local f = win:frame()
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end
hyper:bind({"Ctrl"}, "L", nil, Clfun)


-- Enter Hyper Mode when F18 (Hyper/Right_Command) is pressed
pressedF18 = function()
  hyper.triggered = false
  hyper:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Right_Command) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  hyper:exit()
  if not hyper.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
