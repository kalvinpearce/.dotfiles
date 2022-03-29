local awful = require("awful")
local gears = require("gears")
local client_keys = require("configuration.client.keys")
local client_buttons = require("configuration.client.buttons")

-- Rules
awful.rules.rules = {
	-- { rule_any = { name = { "Wezterm" } }, properties = { skip_decoration = true } },
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			keys = client_keys,
			buttons = client_buttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
			floating = true,
			maximized = false,
			above = false,
			below = false,
			ontop = false,
			sticky = false,
			maximized_horizontal = false,
			maximized_vertical = false,
		},
	}, -- Titlebars
	{
		rule_any = {
			type = { "dialog" },
		},
		properties = {
			placement = awful.placement.centered,
			ontop = true,
			floating = true,
			drawBackdrop = true,
			shape = function()
				return function(cr, w, h)
					gears.shape.rounded_rect(cr, w, h, 8)
				end
			end,
			skip_decoration = true,
		},
	},
}
