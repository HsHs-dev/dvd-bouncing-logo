function love.load()
	local screen_opts = { fullscreen = true, borderless = false, vsync = 1, centered = true }
	love.window.setTitle("DVD Bouncing")
	-- If width or height is 0, setMode will use the width and height of the desktop.
	love.window.setMode(0, 0, screen_opts)

	COLLIDED = false

	-- logo settings
	LOGO = love.graphics.newImage("dvd-video.png")
	SCALE = 0.5
	LOGO_WIDTH = 250
	LOGO_HEIGHT = 120
	-- scalling values
	SX = LOGO_WIDTH / LOGO:getWidth()
	SY = LOGO_HEIGHT / LOGO:getHeight()

	WIDTH = love.graphics.getWidth()
	HEIGHT = love.graphics.getHeight()
	X, Y = WIDTH / 2, HEIGHT / 2
	local speed = 240
	DX, DY = speed, speed
end

function love.update(dt)
	X = X + DX * dt
	Y = Y + DY * dt
	collision_detection()
end

function love.draw()
	if COLLIDED then
		change_color()
		COLLIDED = false
	end
	love.graphics.draw(LOGO, X, Y, 0, SX, SY, (LOGO_WIDTH / 2) / SX, (LOGO_HEIGHT / 2) / SY)
end

function love.keypressed(key)
	if key == "escape" or key == "space" then
		love.event.quit()
	end
end

function collision_detection()
	local half_w = LOGO_WIDTH / 2
	local half_h = LOGO_HEIGHT / 2

	-- detect vertical collsion
	if Y - half_h <= 0 then
		COLLIDED = true
		Y = half_h
		DY = -DY
	end

	if Y + half_h >= HEIGHT then
		COLLIDED = true
		Y = HEIGHT - half_h
		DY = -DY
	end

	-- detect horizontal collsion
	if X - half_w <= 0 then
		COLLIDED = true
		X = half_w
		DX = -DX
	end

	if X + half_w >= WIDTH then
		COLLIDED = true
		X = WIDTH - half_w
		DX = -DX
	end
end

function change_color()
	r = math.random()
	g = math.random()
	b = math.random()
	love.graphics.setColor(r, g, b, 0.7)
end
