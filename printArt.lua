local base = "https://raw.githubusercontent.com/OogyBoogy124/pixalArtLab12/refs/heads/main/"
local addr = base .. "printArt.txt"
local addrGet = http.get(addr)



local function drawLine(line)
	for i = 1, string.len(line) do
		local color = line:sub(i, i)
		turtle.select(4 + tonumber(color))
		turtle.placeDown()
		turtle.forward()
	end
end

local function drawImage(conn)
	while true do
		local line = conn.readLine()
		if line == nil then
			return
		end
		drawLine(line)
		turtle.turnRight()
		turtle.forward()
		turtle.turnRight()
		turtle.forward()

		line = conn.readLine()
		if line == nil then
			return
		end
		drawLine(string.reverse(line))
		turtle.turnLeft()
		turtle.forward()
		turtle.turnLeft()
		turtle.forward()
	end
end

drawImage(addrGet)
addrGet.close()
