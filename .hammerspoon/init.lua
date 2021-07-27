-- this is comment

local hyper = {"cmd", "alt", "ctrl"}
local hypershift = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(hyper, "w", function()
    hs.alert.show("Hello World!")
end)

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

h_bind("x", launchApp("Visual Studio Code"))
h_bind("g", launchApp("Gmail"))
h_bind("b", launchApp("Google Chrome"))
h_bind("i", launchApp("iTerm"))
h_bind("p", launchApp("System Preferences"))
h_bind("f", launchApp("Finder"))
h_bind("'", launchApp("Slack"))
h_bind("u", launchApp("Music"))
h_bind("t", launchApp("aText"))
h_bind("v", launchApp("Voice"))
hs_bind("r", launchApp("Ministry Reading"))
hs_bind("e", launchApp("MR"))


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

h_bind("`", positionWindow(0, 0, 1, 1))
h_bind("1", positionWindow(0, 0, 1/2, 1))
h_bind("2", positionWindow(1/5, 0, 5/8, 1))
h_bind("3", positionWindow(1/2, 0, 1/2, 1))

h_bind("4", positionWindow(1/2, 0, 1/2, 1/2))
h_bind("5", positionWindow(0, 1/2, 1/2, 1/2))
h_bind("6", positionWindow(1/2, 1/2, 1/2, 1/2))

h_bind("q", positionWindow(0, 0, 1/4, 1))
h_bind("w", positionWindow(1/4, 0, 9/24, 1))
h_bind("e", positionWindow(5/8, 0, 3/8, 1))

-- grid based window functions

hs.grid.setGrid('12x6')
hs.grid.setMargins('0x0')

h_bind("right", function()
    local win = hs.window.focusedWindow()
    if win == nil then return end
    local screen = win:screen()
    local sg = hs.grid.getGrid(screen)
    local g = hs.grid.get(win)
    if g.x + g.w == sg.w then
        g.x = g.x + 1
        g.w = g.w - 1
        hs.grid.set(win, g)
    else
        g.w = g.w + 1
        hs.grid.set(win, g)
    end
end)

h_bind("left", function()
    local win = hs.window.focusedWindow()
    if win == nil then return end
    local screen = win:screen()
    local sg = hs.grid.getGrid(screen)
    local g = hs.grid.get(win)
    if g.x + g.w >= sg.w and g.x ~= 0 then
        g.x = g.x - 1
        g.w = g.w + 1
        hs.grid.set(win, g)
    else
        g.w = g.w - 1
        hs.grid.set(win, g)
    end
end)

h_bind("down", function()
    local win = hs.window.focusedWindow()
    if win == nil then return end
    local screen = win:screen()
    local sg = hs.grid.getGrid(screen)
    local g = hs.grid.get(win)
    if g.y + g.h == sg.h then
        g.y = g.y + 1
        g.h = g.h - 1
        hs.grid.set(win, g)
    else
        g.h = g.h + 1
        hs.grid.set(win, g)
    end
end)

h_bind("up", function()
    local win = hs.window.focusedWindow()
    if win == nil then return end
    local screen = win:screen()
    local sg = hs.grid.getGrid(screen)
    local g = hs.grid.get(win)
    if g.y + g.h >= sg.h and g.y ~= 0 then
        g.y = g.y - 1
        g.h = g.h + 1
        hs.grid.set(win, g)
    else
        g.h = g.h - 1
        hs.grid.set(win, g)
    end
end)


hs_bind("right", hs.grid.pushWindowRight)
hs_bind("left", hs.grid.pushWindowLeft)
hs_bind("down", hs.grid.pushWindowDown)
hs_bind("up", hs.grid.pushWindowUp)


-- Spoon
-- install from https://www.hammerspoon.org/Spoons/

clipboardTool = hs.loadSpoon("ClipboardTool")
clipboardTool.paste_on_select = true
clipboardTool.show_in_menubar = false
clipboardTool.show_copied_alert = false
clipboardTool:start()
hs_bind("v", function() clipboardTool:toggleClipboard() end)
hs_bind("c", function() clipboardTool:clearAll() end)

-- vi like cursor movements
keyDelay = 50
h_bind("h", function() hs.eventtap.keyStroke({}, "left", keyDelay) end, true)
h_bind("j", function() hs.eventtap.keyStroke({}, "down", keyDelay) end, true)
h_bind("k", function() hs.eventtap.keyStroke({}, "up", keyDelay) end, true)
h_bind("l", function() hs.eventtap.keyStroke({}, "right", keyDelay) end, true)

-- h_bind("f", function() hs.eventtap.keyStroke({}, "pagedown", keyDelay) end, true)
-- h_bind("b", function() hs.eventtap.keyStroke({}, "pageup", keyDelay) end, true)
h_bind("a", function() hs.eventtap.keyStroke({}, "home", keyDelay) end, true)
h_bind("s", function() hs.eventtap.keyStroke({}, "end", keyDelay) end, true)

