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


-- TODO: more generic solution needed
function HyperKey:bind(mod, key)
    return function (work)
        workWrapper = function ()
            work()
            self._triggered = true
        end
        self._hyperMod:bind(mod, key, nil, workWrapper)
    end
end

-------------------------------------
--  HyperKey class definition end  --
-------------------------------------


function MHyper.new(key)
    return HyperKey:new(key)
end

return MHyper -- end module
