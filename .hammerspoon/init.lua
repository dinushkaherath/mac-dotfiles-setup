
-- this is comment

local hyper = {"cmd", "alt", "ctrl"}
local hypershift = {"cmd", "alt", "ctrl", "shift"}

function h_bind(key, func, repeatKeyPress)
    if repeatKeyPress then
        hs.hotkey.bind(hyper, key, func, nil, func)
    else
        hs.hotkey.bind(hyper, key, func)
    end
end

function hs_bind(key, func, repeatKeyPress)
    if repeatKeyPress then
        hs.hotkey.bind(hypershift, key, func, nil, func)
    else
        hs.hotkey.bind(hypershift, key, func)
    end
end

hs.alert.show("Hammerspoon started")

function file_exists(path)
    local f=io.open(path,"r")
    if f~=nil then io.close(f) return true else return false end
    -- ~= is != in other languages
end

function launchApp(name)
    -- .. is concat string operator
    return function()
        path = "/Applications/" .. name .. ".app"
        if file_exists(path) then
            hs.application.launchOrFocus(path)
            return
        end
        path = "/System/Library/CoreServices/" .. name .. ".app"
        if file_exists(path) then
            hs.application.launchOrFocus(path)
            return
        end
        path = "/System/Applications/" .. name .. ".app"
        if file_exists(path) then
            hs.application.launchOrFocus(path)
            return
        end
        path = "/Users/dinushkaherath/Applications/Chrome Apps.localized/" .. name .. ".app"
        if file_exists(path) then
            hs.application.launchOrFocus(path)
            return
        end
    end
end

h_bind("i", launchApp("iTerm"))
h_bind(",", launchApp("Visual Studio Code"))
h_bind("g", launchApp("Gmail"))
h_bind("b", launchApp("Google Chrome"))
h_bind("p", launchApp("System Preferences"))
h_bind("o", launchApp("Finder"))
h_bind("'", launchApp("Slack"))
h_bind("u", launchApp("Music"))
h_bind("t", launchApp("aText"))


-- window functions

function positionWindow(x, y, w, h)
    return function()
        local win = hs.window.focusedWindow()
        if win == nil then return end
        local f = win:frame()
        local s = win:screen():frame()
        f.x = s.x + s.w * x
        f.y = s.y + s.h * y
        f.w = s.w * w
        f.h = s.h * h
        -- hs.alert.show(s)
        win:setFrame(f)
    end
end

hs.window.animationDuration = 0 

hs_bind("`", positionWindow(1/3, 0, 1/2, 1))

-- Spoon
-- install from https://www.hammerspoon.org/Spoons/

clipboardTool = hs.loadSpoon("ClipboardTool")
clipboardTool.paste_on_select = true
clipboardTool.show_in_menubar = false
clipboardTool.show_copied_alert = false
clipboardTool:start()
h_bind("v", function() clipboardTool:toggleClipboard() end)
-- hs_bind("c", function() clipboardTool:clearAll() end)

-- vi like cursor movements
keyDelay = 50
h_bind("h", function() hs.eventtap.keyStroke({}, "left", keyDelay) end, true)
h_bind("j", function() hs.eventtap.keyStroke({}, "down", keyDelay) end, true)
h_bind("k", function() hs.eventtap.keyStroke({}, "up", keyDelay) end, true)
h_bind("l", function() hs.eventtap.keyStroke({}, "right", keyDelay) end, true)

-- added shift left right selecting
hs_bind("h", function() hs.eventtap.keyStroke({"shift"}, "left", keyDelay) end, true)
hs_bind("j", function() hs.eventtap.keyStroke({"shift"}, "down", keyDelay) end, true)
hs_bind("k", function() hs.eventtap.keyStroke({"shift"}, "up", keyDelay) end, true)
hs_bind("l", function() hs.eventtap.keyStroke({"shift"}, "right", keyDelay) end, true)

-- h_bind("f", function() hs.eventtap.keyStroke({}, "pagedown", keyDelay) end, true)
-- h_bind("b", function() hs.eventtap.keyStroke({}, "pageup", keyDelay) end, true)

h_bind("q", function() hs.eventtap.keyStroke({}, "home", keyDelay) end, true)
h_bind("e", function() hs.eventtap.keyStroke({}, "end", keyDelay) end, true)

-- added start/ end of line
h_bind("a", function() hs.eventtap.keyStroke({"cmd"}, "left", keyDelay) end, true)
h_bind("f", function() hs.eventtap.keyStroke({"cmd"}, "right", keyDelay) end, true)
hs_bind("a", function() hs.eventtap.keyStroke({"cmd", "shift"}, "left", keyDelay) end, true)
hs_bind("f", function() hs.eventtap.keyStroke({"cmd", "shift"}, "right", keyDelay) end, true)

-- added move left/right by word (alt)
h_bind("s", function() hs.eventtap.keyStroke({"alt"}, "left", keyDelay) end, true)
h_bind("d", function() hs.eventtap.keyStroke({"alt"}, "right", keyDelay) end, true)
hs_bind("s", function() hs.eventtap.keyStroke({"alt", "shift"}, "left", keyDelay) end, true)
hs_bind("d", function() hs.eventtap.keyStroke({"alt", "shift"}, "right", keyDelay) end, true)

h_bind(".", function() hs.eventtap.leftClick(hs.mouse.getRelativePosition(), keyDelay) end, true)