------------------------------------------------------------------------
--                     key bindings and settings                      --
------------------------------------------------------------------------


local reload = require "reload"
local yahyper = require "yahyper"
local window = require "window"
local movement = require "movement"
local input = require "input"

hs.window.animationDuration = 0

-----------------
--  hyper key  --
-----------------

hyper = yahyper.new("F18")
hyper:setPressedAloneEvent(input.setEng)
hyper:setPressedAlone("ESCAPE")

--------------
--  window  --
--------------

hyper:bind({"Option"}, "L"):stroke(window.setToRight)
hyper:bind({"Option"}, "H"):stroke(window.setToLeft)
hyper:bind({"Option"}, "J"):stroke(window.setToBottom)
hyper:bind({"Option"}, "K"):stroke(window.setToTop)
hyper:bind({"Option"}, "M"):stroke(window.maximize)
hyper:bind({"Option"}, "Q"):stroke(window.setToUpperLeft)
hyper:bind({"Option"}, "E"):stroke(window.setToUpperRight)
hyper:bind({"Option"}, "Z"):stroke(window.setToLowerLeft)
hyper:bind({"Option"}, "C"):stroke(window.setToLowerRight)

hyper:bind({"Ctrl"}, "L"):stroke(window.focusEast)
hyper:bind({"Ctrl"}, "H"):stroke(window.focusWest)
hyper:bind({"Ctrl"}, "J"):stroke(window.focusSouth)
hyper:bind({"Ctrl"}, "K"):stroke(window.focusNorth)
hyper:bind({"Ctrl"}, "F"):stroke(window.hint)

----------------
--  movement  --
----------------
hyper:bind({}, 'h'):press(movement.hfun)
hyper:bind({}, 'j'):press(movement.jfun)
hyper:bind({}, 'k'):press(movement.kfun)
hyper:bind({}, 'l'):press(movement.lfun)
hyper:bind({}, 'b'):press(movement.bfun)
hyper:bind({}, 'f'):press(movement.ffun)

--------------------
--  input method  --
--------------------

hyper:bind({}, '1'):stroke(input.setEng)
hyper:bind({}, '2'):stroke(input.setChn)
hyper:bind({}, '3'):stroke(input.setJpn)
