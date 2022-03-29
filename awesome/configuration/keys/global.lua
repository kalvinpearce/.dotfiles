local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local modkey = require("configuration.keys.mod").modKey
local altkey = require("configuration.keys.mod").altKey
local apps = require("configuration.apps")

function poweroff_command()
	awful.spawn.with_shell("poweroff")
	awful.keygrabber.stop(_G.exit_screen_grabber)
end

-- Key bindings
local globalKeys = awful.util.table.join( -- Hotkeys
	-- Help
	awful.key({ modkey }, "F1", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

	-- Tags
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }), -- Default client focus

  -- Jump windows
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "r", function()
		_G.awesome.spawn(apps.default.rofi)
	end, { description = "show rofi menu", group = "awesome" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ altkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	-- System
	awful.key({ modkey }, "l", function()
		awful.spawn(apps.default.lock)
	end, { description = "Lock the screen", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "s", function()
		awful.util.spawn(apps.default.screenshot)
	end, {
		description = "Take a screenshot",
		group = "launcher",
	}),
	awful.key({ modkey, "Control" }, "r", _G.awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Control" }, "q", _G.awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "m", function()
		_G.dashboard_show()
	end, { description = "toggle main menu", group = "awesome" }),
	-- awful.key({ modkey, "Shift" }, "p", function()
	-- 	_G.exit_screen_show()
	-- end, { description = "end session menu", group = "awesome" }),

	-- Standard program
	awful.key({ modkey, "Shift" }, "Return", function()
		awful.util.spawn(apps.default.browser)
	end, { description = "open a browser", group = "launcher" }),
	awful.key({ modkey }, "Return", function()
		awful.util.spawn(apps.default.terminal)
	end, { description = "open a terminal", group = "launcher" }),

	-- Layout manipulation
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	-- Resize
	--awful.key({ modkey, "Control" }, "Left",  function () awful.client.moveresize( 20,  20, -40, -40) end),
	--awful.key({ modkey, "Control" }, "Right", function () awful.client.moveresize(-20, -20,  40,  40) end),
	awful.key({ modkey, "Control" }, "Down", function()
		awful.client.moveresize(0, 0, 0, -20)
	end),
	awful.key({ modkey, "Control" }, "Up", function()
		awful.client.moveresize(0, 0, 0, 20)
	end),
	awful.key({ modkey, "Control" }, "Left", function()
		awful.client.moveresize(0, 0, -20, 0)
	end),
	awful.key({ modkey, "Control" }, "Right", function()
		awful.client.moveresize(0, 0, 20, 0)
	end),

	-- Move
	awful.key({ modkey, "Shift" }, "Down", function()
		awful.client.moveresize(0, 20, 0, 0)
	end),
	awful.key({ modkey, "Shift" }, "Up", function()
		awful.client.moveresize(0, -20, 0, 0)
	end),
	awful.key({ modkey, "Shift" }, "Left", function()
		awful.client.moveresize(-20, 0, 0, 0)
	end),
	awful.key({ modkey, "Shift" }, "Right", function()
		awful.client.moveresize(20, 0, 0, 0)
	end),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			_G.client.focus = c
			c:raise()
		end
	end, { description = "restore minimized", group = "client" }),

	awful.key({ modkey }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" }),

	-- Widgets popups
	--[[awful.key(
    {altkey},
    'h',
    function()
      if beautiful.fs then
        beautiful.fs.show(7)
      end
    end,
    {description = 'show filesystem', group = 'widgets'}
  ),
  awful.key(
    {altkey},
    'w',
    function()
      if beautiful.weather then
        beautiful.weather.show(7)
      end
    end,
    {description = 'show weather', group = 'widgets'}
  ),--]]

	-- Brightness
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn("xbacklight -inc 10")
	end, { description = "+10%", group = "hotkeys" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn("xbacklight -dec 10")
	end, { description = "-10%", group = "hotkeys" }), -- ALSA volume control
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn.easy_async("amixer -D pulse sset Master 5%+", function()
			_G.update_volume()
		end)
	end, { description = "volume up", group = "hotkeys" }),
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn.easy_async("amixer -D pulse sset Master 5%-", function()
			_G.update_volume()
		end)
	end, { description = "volume down", group = "hotkeys" }),
	awful.key({}, "XF86AudioMute", function()
		awful.spawn("amixer -D pulse set Master 1+ toggle")
		_G.update_volume()
	end, { description = "toggle mute", group = "hotkeys" }),
	awful.key({}, "XF86AudioNext", function()
		--
	end, { description = "toggle mute", group = "hotkeys" }),
	awful.key({}, "XF86PowerDown", function()
		--
	end, { description = "toggle mute", group = "hotkeys" }),
	awful.key({}, "XF86PowerOff", function()
		_G.exit_screen_show()
	end, { description = "toggle mute", group = "hotkeys" }),

	-- Open default program for tag
	awful.key({ modkey }, "n", function()
		awful.spawn(awful.screen.focused().selected_tag.defaultApp, {
			tag = _G.mouse.screen.selected_tag,
			placement = awful.placement.bottom_right,
		})
	end, { description = "open default program for tag/workspace", group = "tag" }),

	-- Menubar
	awful.key({ modkey }, "p", function()
		awful.spawn.with_shell("rofi -show drun")
	end, { description = "show the menubar", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "p", function()
		awful.spawn.with_shell("rofi -show run")
	end, { description = "run prompt", group = "launcher" }),

	-- Emoji typing
	-- awful.key({ modkey }, ".", function() awful.spawn.with_shell("rofi -modi 'emoji:/usr/bin/rofimoji' -show emoji") end,
	awful.key({ modkey }, ".", function()
		awful.spawn.with_shell("python3 /usr/bin/rofimoji")
	end, { description = "show emoji menu", group = "hotkeys" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	-- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
	local descr_view, descr_toggle, descr_move, descr_toggle_focus
	if i == 1 or i == 9 then
		descr_view = { description = "view tag #", group = "tag" }
		descr_toggle = { description = "toggle tag #", group = "tag" }
		descr_move = {
			description = "move focused client to tag #",
			group = "tag",
		}
		descr_toggle_focus = {
			description = "toggle focused client on tag #",
			group = "tag",
		}
	end
	globalKeys = awful.util.table.join(
		globalKeys, -- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, descr_view), -- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, descr_toggle), -- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if _G.client.focus then
				local tag = _G.client.focus.screen.tags[i]
				if tag then
					_G.client.focus:move_to_tag(tag)
				end
			end
		end, descr_move), -- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if _G.client.focus then
				local tag = _G.client.focus.screen.tags[i]
				if tag then
					_G.client.focus:toggle_tag(tag)
				end
			end
		end, descr_toggle_focus)
	)
end

return globalKeys
