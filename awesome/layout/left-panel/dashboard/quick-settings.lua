local wibox = require("wibox")

return wibox.widget({
	require("widget.volume.volume-slider"),
	require("widget.brightness.brightness-slider"),
	layout = wibox.layout.fixed.vertical,
})
