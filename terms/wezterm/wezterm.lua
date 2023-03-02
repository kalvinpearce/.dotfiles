local wezterm = require("wezterm")

return {
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Wombat",
	font = wezterm.font_with_fallback({
		"Hack Nerd Font Mono",
		"Terminus",
		"Noto Color Emoji",
	}),
	font_size = 12.0,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	default_cursor_style = "BlinkingBar",
	enable_csi_u_key_encoding = false,
	warn_about_missing_glyphs = false,
	exit_behavior = "Close",
	adjust_window_size_when_changing_font_size = false,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	check_for_updates = false,
}
