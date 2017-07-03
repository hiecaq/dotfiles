------------------------------------------------------------------------
--              yahyper -- yet another Hyper Key Module               --
------------------------------------------------------------------------

local MHyper = {} -- module

local BindKey = {}
local HyperKey = {}

-------------------------------------
--    HyperKey class definition    --
-------------------------------------

-- HyperKey is a class that implements the features of a hyper key.
-- HyperKey:new(key)                      -> a constructor of HyperKey, taken one argument (the name of the key)
-- HyperKey:setPressedAlone(targetKey)    -> set what key is returned when the hyper key is pressed alone
-- HyperKey:bind(mod, key)                -> return a BindKey object by taken two arguments, modifier (mod) and key


function HyperKey:new(key)
    local this = {
        _triggered = false,
        _hyperMod = nil,
        _alone = function () return nil end,
    }
    self.__index = self
    setmetatable(this, self)

    this._pressed = function()
        this._triggered = false
        this._hyperMod:enter()
    end

    this._released = function()
        this._hyperMod:exit()
        if not this._triggered then
            this._alone()
        end
    end
    -- constructor begin
    this._hyperMod = hs.hotkey.modal.new({"shift"}, key)
    hs.hotkey.bind({}, key, this._pressed, this._released)
    -- constructor end
    return this
end

function HyperKey:setPressedAlone(targetKey)
    self._alone = function()
        hs.eventtap.keyStroke({}, targetKey)
    end
end


function HyperKey:bind(mod, key)
    return BindKey:new(self, mod, key)
end

--------------------------------
--  BindKey class definition  --
--------------------------------

-- BindKey is a class that implements a key combination that can invoke something.
-- BindKey:new(hyper, mod, key)                  -> the constructor that takes three arguments: hyper (its parent), *mod*ifier, key
-- BindKey:stroke(event)                         -> set what happens if a key is stroked
-- BindKey:press(event)                          -> set what happens if a key is pressed

function BindKey:new(hyper, mod, key)
    local this = {
        _hyper = hyper, -- parent HyperKey
        _mod = mod,
        _key = key
    }
    self.__index = self
    return setmetatable(this, self)
end

function BindKey:stroke(event)
    wrappedEvent = function ()
        event()
        self._hyper._triggered = true
    end
    self._hyper._hyperMod:bind(self._mod, self._key, nil, wrappedEvent)
end

function BindKey:press(event)
    wrappedEvent = function ()
        event()
        self._hyper._triggered = true
    end
    self._hyper._hyperMod:bind(self._mod, self._key, wrappedEvent, nil, wrappedEvent)
end

-----------------------------
--  end class definitions  --
-----------------------------

function MHyper.new(key)
    return HyperKey:new(key)
end

return MHyper -- end module
