local beautiful = require("beautiful")
local wibox = require("wibox")
local TagList = require("widget.tag-list")

local dpi = require("beautiful").xresources.apply_dpi

local WorkspacePanel = function(s)
	local offsetx = dpi(50)
	local offsety = dpi(12)
	local panel = wibox({
		ontop = false,
		screen = s,
		height = dpi(32),
		width = dpi(180),
		x = s.geometry.x + offsetx,
		y = s.geometry.y + offsety,
		stretch = false,
		bg = beautiful.primary.hue_900,
		fg = beautiful.fg_normal,
		struts = { top = dpi(32) },
	})

	panel:setup({ layout = wibox.layout.align.horizontal, TagList(s) })

	return panel
end

return WorkspacePanel
