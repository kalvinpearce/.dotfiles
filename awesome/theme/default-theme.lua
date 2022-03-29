local filesystem = require("gears.filesystem")
local mat_colors = require("theme.mat-colors")
local theme_dir = filesystem.get_configuration_dir() .. "/theme"
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi
local theme = {}
theme.icons = theme_dir .. "/icons/"
theme.font = "Roboto medium 10"

-- Colors Pallets

-- Primary
theme.primary = mat_colors.deep_orange

-- Accent
theme.accent = mat_colors.orange

-- Background
theme.background = mat_colors.grey

local awesome_overrides = function(local_theme)
	local_theme.dir = os.getenv("HOME") .. "/.config/awesome/theme"

	local_theme.icons = local_theme.dir .. "/icons/"
	local_theme.font = "Roboto medium 10"
	local_theme.title_font = "Roboto medium 14"

	local_theme.fg_normal = "#ffffffde"

	local_theme.fg_focus = "#e4e4e4"
	local_theme.fg_urgent = "#CC9393"
	local_theme.bat_fg_critical = "#232323"

	local_theme.bg_normal = local_theme.primary.hue_900
	local_theme.bg_focus = "#5a5a5a"
	local_theme.bg_urgent = "#3F3F3F"
	local_theme.bg_systray = local_theme.primary.hue_900

	-- Borders

	local_theme.border_width = dpi(1)
	local_theme.border_normal = local_theme.primary.hue_900
	local_theme.border_focus = local_theme.primary.hue_500
	local_theme.border_marked = "#CC9393"

	-- Menu

	local_theme.menu_height = dpi(16)
	local_theme.menu_width = dpi(160)

	-- Tooltips
	local_theme.tooltip_bg = "#232323"
	-- theme.tooltip_border_color = '#232323'
	local_theme.tooltip_border_width = 0
	local_theme.tooltip_shape = function(cr, w, h)
		gears.shape.rounded_rect(cr, w, h, dpi(6))
	end

	-- Layout

	local_theme.layout_max = local_theme.icons .. "layouts/arrow-expand-all.png"
	local_theme.layout_tile = local_theme.icons .. "layouts/view-quilt.png"
	local_theme.layout_floating = local_theme.icons .. "layouts/floating.png"

	-- Taglist

	local_theme.taglist_bg_empty = local_theme.primary.hue_900
	local_theme.taglist_bg_occupied = local_theme.primary.hue_900
	local_theme.taglist_bg_urgent = "linear:0,0:0,"
		.. dpi(48)
		.. ":0,"
		.. local_theme.accent.hue_500
		.. ":0.07,"
		.. local_theme.accent.hue_500
		.. ":0.07,"
		.. local_theme.primary.hue_900
		.. ":1,"
		.. local_theme.primary.hue_900
	local_theme.taglist_bg_focus = "linear:0,0:0,"
		.. dpi(32)
		.. ":0,"
		.. local_theme.primary.hue_900
		.. ":0.9,"
		.. local_theme.primary.hue_900
		.. ":0.9,"
		.. local_theme.primary.hue_500
		.. ":1,"
		.. local_theme.primary.hue_500

	-- Tasklist

	local_theme.tasklist_font = "Roboto medium 11"
	local_theme.tasklist_bg_normal = local_theme.primary.hue_900
	local_theme.tasklist_bg_focus = "linear:0,0:0,"
		.. dpi(32)
		.. ":0,"
		.. local_theme.primary.hue_900
		.. ":0.9,"
		.. local_theme.primary.hue_900
		.. ":0.9,"
		.. local_theme.fg_normal
		.. ":1,"
		.. local_theme.fg_normal
	local_theme.tasklist_bg_urgent = local_theme.primary.hue_900
	local_theme.tasklist_fg_focus = "#DDDDDD"
	local_theme.tasklist_fg_urgent = local_theme.fg_normal
	local_theme.tasklist_fg_normal = "#AAAAAA"

	local_theme.icon_theme = "Tela circle purple dark"

	-- Client
	local_theme.border_width = dpi(1)
	local_theme.border_focus = local_theme.primary.hue_100
	local_theme.border_normal = local_theme.primary.hue_900
end
return { theme = theme, awesome_overrides = awesome_overrides }
