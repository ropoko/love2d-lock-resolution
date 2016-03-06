require "ball"
require "camera"


function love.load(arg)
	math.randomseed(os.clock())
	camera:setLockedResolution(1280, 720)
	for i=1,25 do
		table.insert(holder_balls, #holder_balls+1, Ball())
	end
end

function love.keypressed( key )
	if key == "up" then
		table.insert(holder_balls, #holder_balls+1, Ball())
	end

	if key == "down" then
	   table.remove(holder_balls, #holder_balls)
	end

	if key == "escape" then
		love.event.quit()
	end
end

function love.resize()
	camera:setLockedResolution(1280, 720)
end

function love.update(dt)
	for k,v in pairs(holder_balls) do
		v:move(dt)
	end
end

function love.draw(dt)
	camera:set()
	for k,v in pairs(holder_balls) do
		love.graphics.circle("fill", v.x, v.y, v.radius, 100)
	end
	love.graphics.rectangle("fill", 0, 0, camera.width, 2)
	love.graphics.rectangle("fill", 0, 0, 2, camera.height)
	love.graphics.rectangle("fill", camera.width-2, 0, 2, camera.height)
	love.graphics.rectangle("fill", 0, camera.height-2, camera.width, 2)
	camera:unset()
end