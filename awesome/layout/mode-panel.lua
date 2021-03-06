local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local clickable_container = require("widget.material.clickable-container")

local dpi = require("beautiful").xresources.apply_dpi

local LayoutBox = function(s)
	local layoutBox = clickable_container(awful.widget.layoutbox(s))
	layoutBox:buttons(awful.util.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	return layoutBox
end

local ModePanel = function(s)
	local panel = wibox({
		ontop = false,
		screen = s,
		height = dpi(32),
		width = dpi(32),
		x = s.geometry.width - dpi(44),
		y = s.geometry.y + dpi(12),
		stretch = false,
		bg = beautiful.primary.hue_900,
		fg = beautiful.fg_normal,
		struts = { top = dpi(32) },
	})

	panel:setup({
		layout = wibox.layout.align.horizontal,
		{ layout = wibox.layout.fixed.horizontal, LayoutBox(s) },
		nil,
		nil,
	})

	return panel
end

return ModePanel
