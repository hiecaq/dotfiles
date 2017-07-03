------------------------------------------------------------------------
--              yahyper -- yet another Hyper Key Module               --
------------------------------------------------------------------------

local MHyper = {} -- module

-------------------------------------
--    HyperKey class definition    --
-------------------------------------

local HyperKey = {}

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

BindKey = {}

function BindKey:new(hyper, mod, key)
    local this = {
        _hyper = hyper, -- father HyperKey
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
