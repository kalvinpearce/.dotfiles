local wibox = require("wibox")

return wibox.widget({
	require("widget.cpu.cpu-meter"),
	require("widget.ram.ram-meter"),
	require("widget.temperature.temperature-meter"),
	require("widget.harddrive.harddrive-meter"),
	layout = wibox.layout.fixed.vertical,
})
