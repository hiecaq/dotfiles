local fs = require("gears.filesystem")

local THIS = {} -- module

local Dirtable = {}

function Dirtable:new(dirpath, filelist)
    local this = { _dirpath = dirpath }
    self.__index = self
    setmetatable(this, self)

    for _, file in ipairs(filelist) do
        local content = this:content(this:fullpath(file))
        if content then
            this[file] = content
        end
    end
    return this
end

function Dirtable:fullpath(filename)
    return table.concat({self._dirpath, filename}, '/')
end

function Dirtable:content(filepath)
    if fs.is_dir(filepath) then
        return nil
    end
    local file = io.open(filepath, 'r')
    if not file then
        return nil
    end
    local content = file:read("*a")
    file:close()
    return content
end

function THIS.dirtable(dirpath, filelist)
    return Dirtable:new(dirpath, filelist)
end

return THIS -- end module
