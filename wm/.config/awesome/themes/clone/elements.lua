local colors = require("themes.clone.colors")

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

theme.font          = "JetBrainsMono Nerd Font Mono Regular 9"--"Terminus 8" -- "Tamsyn 10" -- "Sans 8"
theme.taglist_font  = "JetBrainsMono Nerd Font Mono Bold 8"--"Inconsolata Medium 9"

theme.bg_normal     = colors.color['base10']     .. "cc"
theme.bg_focus      = colors.color['base00']    .. "cc"
theme.bg_urgent     = colors.color['base18'] .. "cc"
theme.bg_minimize   = colors.color['base03']   .. "cc"
theme.bg_systray    = colors.color['base10']   .. "cc"

theme.fg_normal     = colors.color['base06']
theme.fg_focus      = colors.color['base1A']
theme.fg_urgent     = colors.color['base0E']
theme.fg_minimize   = colors.color['base07']

theme.useless_gap   = dpi(3)
theme.border_width  = dpi(1.5)

theme.border_normal = colors.color['base10']   .. "cc"
theme.border_focus  = colors.color['base18']    .. "cc"
-- theme.border_marked = colors.color['base0E'] .. "cc"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:

theme.taglist_bg_focus = colors.color['base18'] .. "88"
--theme.taglist_bg_focus = "png:" .. theme_path .. "misc/copycat-holo/taglist_bg_focus.png"
-- theme.taglist_fg_focus = colors.color['base00']


theme.tasklist_bg_normal = colors.color['base10']    .. "88"
--theme.tasklist_bg_normal = "png:" .. theme_path .. "misc/copycat-holo/bg_focus.png"
theme.tasklist_bg_focus  = colors.color['base18']   .. "88"
--theme.tasklist_bg_focus  = "png:" .. theme_path .. "misc/copycat-holo/bg_focus_noline.png"
-- theme.tasklist_fg_focus  = colors.color['base07']

theme.titlebar_bg_normal = colors.color['base00']  -- .. "aa"
theme.titlebar_bg_focus  = colors.color['base18'] .. "88"
-- theme.titlebar_fg_focus  = colors.color['base10']  -- .. "aa"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, colors.color['base00']
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, colors.color['base07']
)

-- Display the taglist squares

-- override
theme.taglist_squares_sel      = theme_path .. "taglist/custom/squarefz.png"
theme.taglist_squares_unsel    = theme_path .. "taglist/custom/squareez.png"


-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon  = theme_path .. "misc/default/submenu.png"

theme.menu_height = 20      -- dpi(15)
theme.menu_width  = 180     -- dpi(100)
--theme.menu_context_height = 20

theme.menu_bg_normal = colors.color['base00']  .. "cc"
theme.menu_bg_focus  = colors.color['base08'] .. "cc"
theme.menu_fg_focus  = colors.color['black']

theme.menu_border_color = colors.color['blue500'] .. "cc"
theme.menu_border_width = 0

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"
