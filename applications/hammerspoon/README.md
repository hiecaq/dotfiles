# Hammerspoon configuration #

My personal [Hammerspoon][hs] configuration.  
I've only read [Learn Lua in Y minutes][lliym], so any feedback/advice is appreciated.

[lliym]:https://learnxinyminutes.com/docs/lua/ "Learn Lua in Y minutes"

[hs]:http://www.hammerspoon.org/ "Hammerspoon"

## Description ##

- `init.lua` module requirements, settings, key bindings
- `movement.lua` cursor movement
- `reload.lua` auto reload config files
- `window.lua` window resizing
- `yahyper.lua` a hyper key implementation

## Usage ##

`yahyper.lua`:

```lua
-- import
local yahyper = require `yahyper.lua`
-- construct a hyper key, using YOUR_FAVORITE_KEY
hyper = yahyper.new("YOUR_FAVORITE_KEY")
-- set what key is invoked when hyper key is pressed alone
hyper:setPressedAlone("THE_KEY_YOU_INTENDED")
-- construct a key combination, e.g., hyper+Ctrl+v
hyper:bind({"Ctrl"}, "v")
-- set what happened when the key combination strokes
hyper:bind({"Ctrl"}, "v"):stroke(func)
-- set what happened when the key combination is pressed
hyper:bind({"Ctrl"}, "v"):press(func)
```

## Reference ##

Adopted some ideas from:
- [gwww's configuration][gc]
- [hyperex][hr]

[hr]:https://github.com/hetima/hammerspoon-hyperex "Hammerspoon-hyperex"

[gc]:https://github.com/gwww/dotfiles/blob/master/_hammerspoon/hyperkey.lua "gwww's hyperkey.lua"
