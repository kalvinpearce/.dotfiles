local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

-- Clock / Calendar 24h format
local textclock = wibox.widget.textclock('<span font="Roboto Mono bold 9">%H:%M</span>')

local clock_widget = wibox.container.margin(textclock, dpi(8), dpi(8), dpi(8), dpi(8))

local ClockPanel = function(s)
	local panel = wibox({
		ontop = false,
		screen = s,
		height = dpi(32),
		width = dpi(48),
		x = s.geometry.width - dpi(184),
		y = s.geometry.y + dpi(12),
		stretch = false,
		bg = beautiful.primary.hue_900,
		fg = beautiful.fg_normal,
		struts = { top = dpi(32) },
	})

	panel:setup({ layout = wibox.layout.fixed.horizontal, clock_widget })

	return panel
end

return ClockPanel
