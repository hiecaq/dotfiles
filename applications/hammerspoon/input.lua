------------------------------------------------------------------------
--                            Input Source                            --
------------------------------------------------------------------------


local MISource = {}

local keycodes = require "hs.keycodes"

local chn = "com.apple.inputmethod.SCIM.ITABC"
local jpn = "com.apple.inputmethod.Kotoeri.Japanese"
local eng = "com.apple.keylayout.US"

-- help function for building input source setting function
local function setSource(src)
    return function()
        keycodes.currentSourceID(src)
    end
end

MISource.setJpn = setSource(jpn)
MISource.setChn = setSource(chn)
MISource.setEng = setSource(eng)

return MISource
