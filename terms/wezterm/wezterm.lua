local wezterm = require("wezterm")

return {
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Wombat",
	font = wezterm.font("Hack Nerd Font Mono"),
	font_size = 12.0,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	default_cursor_style = "BlinkingBar",
	enable_csi_u_key_encoding = true,
	exit_behavior = "Close",
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
