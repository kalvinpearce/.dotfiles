local awful = require("awful")
local icons = require("theme.icons")
local apps = require("configuration.apps")
local centered = require("configuration.tags.layouts.centered")
local termfair = require("configuration.tags.layouts.termfair")
local singleCentered = require("configuration.tags.layouts.single-centered")

local tags = {
	{
		icon = icons.chrome,
		type = "browser",
		defaultApp = apps.default.browser,
		screen = 1,
		layout = singleCentered.large,
		layouts = {
			singleCentered.large,
			singleCentered,
		},
	},
	{
		icon = icons.code,
		type = "dev",
		defaultApp = apps.default.terminal,
		screen = 1,
		layout = termfair.center,
	},
	{
		icon = icons.music,
		type = "music",
		defaultApp = apps.default.music,
		screen = 1,
		layout = singleCentered,
		layouts = {
			singleCentered,
			singleCentered.large,
			awful.layout.suit.max,
		},
	},
	{
		icon = icons.social,
		type = "social",
		defaultApp = apps.default.social,
		screen = 1,
		layout = singleCentered,
	},
	{
		icon = icons.folder,
		type = "files",
		defaultApp = apps.default.files,
		screen = 1,
		layout = awful.layout.suit.tile,
	},
	{ icon = icons.lab, type = "any", defaultApp = apps.default.rofi, screen = 1 },
}

awful.layout.layouts = {
	singleCentered.large,
	awful.layout.suit.tile,
	awful.layout.suit.max,
	awful.layout.suit.floating,
	centered,
	termfair.center,
}

awful.screen.connect_for_each_screen(function(s)
	for i, tag in pairs(tags) do
		awful.tag.add(i, {
			icon = tag.icon,
			icon_only = true,
			layout = tag.layout or awful.layout.suit.floating,
			gap_single_client = true,
			gap = 4,
			screen = s,
			defaultApp = tag.defaultApp,
			selected = i == 1,
			layouts = tag.layouts,
		})
	end
end)

_G.tag.connect_signal("property::layout", function(t)
	local currentLayout = awful.tag.getproperty(t, "layout")
	if currentLayout == awful.layout.suit.max then
		t.gap = 4
	else
		t.gap = 4
	end
end)
