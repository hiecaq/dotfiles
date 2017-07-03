------------------------------------------------------------------------
--                     key bindings and settings                      --
------------------------------------------------------------------------


local reload = require "reload"
local yahyper = require "yahyper"
local window = require "window"
local movement = require "movement"

hs.window.animationDuration = 0

-----------------
--  hyper key  --
-----------------

hyper = yahyper.new("F18")
hyper:setPressedAlone("ESCAPE")

--------------
--  window  --
--------------

hyper:bind({"Ctrl"}, "L"):stroke(window.Clfun)
hyper:bind({"Ctrl"}, "H"):stroke(window.Chfun)
hyper:bind({"Ctrl"}, "M"):stroke(window.Cmfun)

----------------
--  movement  --
----------------
hyper:bind({}, 'h'):press(movement.hfun)
hyper:bind({}, 'j'):press(movement.jfun)
hyper:bind({}, 'k'):press(movement.kfun)
hyper:bind({}, 'l'):press(movement.lfun)
hyper:bind({}, 'b'):press(movement.bfun)
hyper:bind({}, 'f'):press(movement.ffun)
