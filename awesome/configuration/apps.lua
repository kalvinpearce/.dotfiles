local rofi_command =
	"env /usr/bin/rofi -show drun -display-drun -run-command \"/bin/bash -c -i 'shopt -s expand_aliases; {cmd}'\""

return {
	-- List of apps to start by default on some actions
	default = {
		terminal = "env wezterm",
		rofi = rofi_command,
		lock = "i3lock-fancy",
		screenshot = "flameshot gui",

		-- Editing these also edits the default program
		-- associated with each tag/workspace
		browser = "env google-chrome-stable",
		editor = "nvim",
		files = "dolphin",
		music = "spotify",
		social = "discord",
		game = rofi_command,
	},
	-- List of apps to start once on start-up
	run_on_start_up = {
		-- Add applications that need to be killed between reloads
		-- to avoid multipled instances, inside the autostart script
		"~/.config/awesome/configuration/autostart", -- Spawn "dirty" apps that can linger between sessions
		"nitrogen --restore",
		"gwe --hide-window",
		"signal-desktop --start-in-tray",
		"nm-applet --indicator",
		-- 'ibus-daemon --xim --daemonize', -- Ibus daemon for keyboard
		-- 'blueman-tray' -- bluetooth tray
	},
}
