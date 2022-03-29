local awful = require('awful')
local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi

local percentage = wibox.widget.textbox()
percentage.align = 'center'
percentage.valign = 'center'

function update_volume()
    awful.spawn.easy_async("amixer -D pulse sget Master", function(stdout)
        local volume = string.match(stdout, '(%d?%d?%d)%%')
        percentage.text = volume
        collectgarbage('collect')
    end)
end

update_volume()

local volume_setting = wibox.widget {
    percentage,
    forced_width = dpi(32),
    widget = wibox.container.background
}

return volume_setting
