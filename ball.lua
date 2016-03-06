Ball = {}
Ball.__index = Ball
holder_balls = {}

function Ball.new(x, y, xspeed, yspeed, radius)
	x = x or math.random(love.graphics.getWidth())
	y = y or math.random(love.graphics.getHeight())
	xspeed = xspeed or math.random(1000)-500
	yspeed = yspeed or math.random(1000)-500
	radius = radius or math.random(50)
	local data = {
		radius = radius or 10,
		x = x or 0,
		y = y or 0,
		xspeed = xspeed or 0,
		yspeed = yspeed or 0
	}
	return setmetatable(data, Ball)
end

function Ball:move(dt)
	self.x = self.x + (self.xspeed*dt)
	self.y = self.y + (self.yspeed*dt)
	if self.x-self.radius <= 0 then
	    self.xspeed = math.abs(self.xspeed)
	end
	if self.x+self.radius >= camera.width then
		self.xspeed = math.abs(self.xspeed)*-1
	end
	if self.y-self.radius <= 0 then
	    self.yspeed = math.abs(self.yspeed)
	end
	if self.y+self.radius >= camera.height then
		self.yspeed = math.abs(self.yspeed)*-1
	end
end

setmetatable(Ball, { __call = function(_, ...) return Ball.new(...) end })