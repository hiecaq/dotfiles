-------------------------
--  Environment Setup  --
-------------------------

hs.window.animationDuration = 0


-- Modifier shortcuts
local hyper= {}

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()
  local f = win:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
  local r = win:size()
  r.w = r.w + 4
  r.h = max.h
  win:move(hs.geometry.point(-4, 0))
  win:setSize(r)
end)

