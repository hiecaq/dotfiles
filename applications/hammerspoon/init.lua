------------------------------------------------------------------------
--                     key bindings and settings                      --
------------------------------------------------------------------------


local reload = require "reload"
local yahyper = require "yahyper"
local window = require "window"

hs.window.animationDuration = 0

-----------------
--  hyper key  --
-----------------

hyper = yahyper.new("F18")
hyper:setPressedAlone("ESCAPE")

--------------
--  window  --
--------------

hyper:bind({"Ctrl"}, "L")(window.Clfun)
hyper:bind({"Ctrl"}, "H")(window.Chfun)
hyper:bind({"Ctrl"}, "M")(window.Cmfun)

----------------
--  movement  --
----------------

