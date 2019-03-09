local fs = require("gears.filesystem")
local awful = require("awful")
local str = require("gears.string")

local THIS = {} -- module

-- Dirtable(dirpath, filelist) {{{
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
-- Dirtable(dirpath, filelist) }}}

-- AsyncTsv(cmd, fields) {{{
local AsyncTsv = {}

function AsyncTsv:new(cmd, fields)
    local this = { _cmd = cmd, _fields = fields }
    self.__index = self
    setmetatable(this, self)

    return this
end

function AsyncTsv:do_with(callback)
    awful.spawn.easy_async_with_shell(self._cmd, function(stdout, stderr, reason, exit_code)
        local output = str.split(stdout:match("^%s*(.-)%s*$"), "\t")
        local tsv = {}
        for i, field in ipairs(self._fields) do
            tsv[field] = output[i]
        end
        callback(tsv)
    end)
end

function THIS.async_tsv(cmd, fields)
    return AsyncTsv:new(cmd, fields)
end
-- AsyncTsv(cmd, fields) }}}

return THIS -- end module

-- vim: foldenable:foldmethod=marker
