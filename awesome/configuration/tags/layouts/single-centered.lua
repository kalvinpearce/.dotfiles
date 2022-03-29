local layout = { name = "single-center" }
layout.large = { name = "single-center-large" }

local function arrange(p, type)
	local width = 1920
	local height = 1080

	if type == "large" then
		width = 2560
		height = 1440
	end

	local area = p.workarea

	local client = p.clients[1]
	local geo
	geo = {
		x = area.x + (area.width - width) / 2,
		y = area.y + (area.height - height) / 3.5,
		width = width,
		height = height,
	}
	p.geometries[client] = geo

	for i = 2, #p.clients do
		p.clients[i].floating = true
	end
end

function layout.arrange(p)
	arrange(p, "normal")
end
function layout.large.arrange(p)
	arrange(p, "large")
end

return layout
