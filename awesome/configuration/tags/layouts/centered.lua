local layout = {}

layout.name = "centered"

function layout.arrange(p)
	local area = p.workarea

	local function posClient(id, x, y, w, h)
		local client = p.clients[id]
		local geo
		geo = {
			x = x,
			y = y,
			width = w,
			height = h,
		}
		p.geometries[client] = geo
	end

	local x = area.x
	local y = area.y
	local halfX = area.width / 2
	local qrtrX = area.width / 4
	local halfY = area.height / 2
	local qrtrY = area.height / 4

	if #p.clients == 1 then
		posClient(1, x + qrtrX, y + qrtrY, halfX, halfY)
	else
		posClient(1, x + qrtrX, y + qrtrY, halfX, halfY)
		for i = 2, #p.clients do
			p.clients[i].floating = true
		end

	-- elseif #p.clients == 2 then
	-- 	posClient(1, x, y + qrtrY, halfX, halfY)
	-- 	posClient(2, x + halfX, y + qrtrY, halfX, halfY)
	-- elseif #p.clients == 3 then
	-- 	posClient(1, x, y, halfX, halfY)
	-- 	posClient(2, x + halfX, y, halfX, halfY)
	-- 	posClient(3, x, y + halfY, halfX, halfY)
	-- elseif #p.clients == 4 then
 --        posClient(1, x, y, halfX, halfY)
 --        posClient(2, x + halfX, y, halfX, halfY)
 --        posClient(3, x, y + halfY, halfX, halfY)
	-- 	posClient(4, x + halfX, y + halfY, halfX, halfY)
	end
end

return layout
