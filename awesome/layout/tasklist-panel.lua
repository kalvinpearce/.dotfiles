local beautiful = require("beautiful")
local wibox = require("wibox")
local TaskList = require("widget.task-list")

local dpi = require("beautiful").xresources.apply_dpi

local TasklistPanel = function(s)
	local offsetx = dpi(512)
	local offsety = dpi(12)
	local panel = wibox({
		ontop = false,
		screen = s,
		height = dpi(32),
		width = s.geometry.width - 2 * offsetx,
		x = s.geometry.x + offsetx,
		y = s.geometry.y + offsety,
		stretch = false,
		bg = beautiful.primary.hue_900,
		fg = beautiful.fg_normal,
		struts = { top = dpi(32) },
	})

	panel:setup({
		layout = wibox.layout.align.horizontal,
		nil,
		{
			TaskList(s),
			layout = wibox.layout.fixed.horizontal,
		},
		nil,
	})

	return panel
end

return TasklistPanel
