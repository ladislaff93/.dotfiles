local awful = require("awful")
awful.util = require("awful.util")

theme_path = awful.util.getdir("config") .. "/themes/clone/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

theme = {}

dofile(theme_path .. "elements.lua")
dofile(theme_path .. "titlebar.lua")
dofile(theme_path .. "layouts.lua")

-- theme.wallpaper          = theme_path .. "background.png"
theme.wallpaper          = theme_path .. "80s-retro-tropical-sunset-by-freepik.jpg"
theme.awesome_icon       = theme_path .. "launcher/win98.png"
theme.awesome_subicon    = theme_path .. "launcher/win98.png"

return theme


