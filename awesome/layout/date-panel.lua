local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

local dpi = require("beautiful").xresources.apply_dpi

local textclock = wibox.widget.textclock('<span font="Roboto Mono bold 9">%d.%m.%Y\n     %H:%M</span>')

local date_widget = wibox.container.margin(textclock, dpi(8), dpi(8), dpi(8), dpi(8))

local month_calendar = awful.widget.calendar_popup.month({
	screen = s,
	start_sunday = false,
	week_numbers = true,
})
month_calendar:attach(textclock)

local DatePanel = function(s)
	local offsety = dpi(12)
	local panel = wibox({
		ontop = false,
		screen = s,
		height = dpi(32),
		width = dpi(80),
		x = s.geometry.width - dpi(130),
		y = s.geometry.y + offsety,
		stretch = false,
		bg = beautiful.primary.hue_200,
		fg = beautiful.primary.hue_900,
		struts = { top = dpi(32) },
	})

	panel:setup({ layout = wibox.layout.fixed.horizontal, date_widget })

	return panel
end

return DatePanel
