local Ball = require('ball')
local Camera = require('camera')

function love.load()
	love.window.setTitle('Locked Resolution Test')
	love.window.setMode(1024, 768, { resizable = true })

	math.randomseed(os.clock())
	Camera:setLockedResolution(1024, 768)
	for i=1,25 do
		table.insert(Ball.all_balls, #Ball.all_balls+1, Ball())
	end
end

function love.keypressed( key )
	if key == 'up' then
		table.insert(Ball.all_balls, #Ball.all_balls+1, Ball())
	end

	if key == 'down' then
	   table.remove(Ball.all_balls, #Ball.all_balls)
	end

	if key == 'escape' then
		love.event.quit()
	end
end

function love.resize()
	Camera:setLockedResolution(1280, 720)
end

function love.update(dt)
	for _,v in pairs(Ball.all_balls) do
		v:move(dt)
	end
end

function love.draw()
	Camera:set()
	for k,v in pairs(Ball.all_balls) do
		love.graphics.circle('fill', v.x, v.y, v.radius, 100)
	end

	love.graphics.setColor(1,0,0)
	love.graphics.rectangle('fill', 0, 0, Camera.width, 4)
	love.graphics.rectangle('fill', 0, 0, 4, Camera.height)
	love.graphics.rectangle('fill', Camera.width-4, 0, 4, Camera.height)
	love.graphics.rectangle('fill', 0, Camera.height-4, Camera.width, 4)
	love.graphics.setColor(1,1,1)

	Camera:unset()
end
