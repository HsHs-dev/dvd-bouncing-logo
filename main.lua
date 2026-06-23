-- -1 to use adaptive vsync (where supported)
SCREEN_OPTIONS = { fullscreen = true, borderless = false, vsync = -1, centered = true }

function love.load()
	love.window.setTitle("DVD Bouncing")
	-- If width or height is 0, setMode will use the width and height of the desktop.
	love.window.setMode(0, 0, SCREEN_OPTIONS)
	LOGO = love.graphics.newImage("dvd-video.png")
	LOGO_WIDTH = LOGO:getWidth()
	LOGO_HEIGHT = LOGO:getHeight()
end

function love.draw()
	local r, g, b = love.math.colorFromBytes(132, 163, 238)
	love.graphics.setBackgroundColor(r, g, b)
	WIDTH = love.graphics.getWidth()
	HEIGHT = love.graphics.getHeight()
	love.graphics.draw(LOGO, WIDTH / 2, HEIGHT / 2, 0, 0.5, 0.5, LOGO_WIDTH / 2, LOGO_HEIGHT / 2)
end

function love.keypressed(key)
	if key == "escape" or key == "space" then
		love.event.quit()
	end
end
