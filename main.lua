_G.love = require("love");

function playSound(sound)
	sound:stop()
	sound:play()
end

function changeBgColor()
	math.randomseed(love.timer.getTime());
	love.graphics.setBackgroundColor(math.random(), math.random(), math.random(), 1)
end

function love.load()
	winX, winY = love.graphics.getDimensions();
	_G.squareObj = {
		x = 5,
		y = 5,
		w = 100,
		h = 100,
		s = 200,
		state = {
			hor = true,
			ver = true
		}
	}
	clicksfx = love.audio.newSource("Assets/Sounds/click.mp3", "static")
	clicksfx:setVolume(0.5)
end

function love.update(dt)
	if squareObj.state.hor then
		squareObj.x = squareObj.x + squareObj.s * dt
	else
		squareObj.x = squareObj.x - squareObj.s * dt
	end

	if squareObj.state.ver then
		squareObj.y = squareObj.y + squareObj.s * dt
	else
		squareObj.y = squareObj.y - squareObj.s * dt
	end
end

function love.draw()
	love.graphics.rectangle("fill", squareObj.x, squareObj.y, squareObj.w, squareObj.h)
	if squareObj.x + squareObj.w + 5 > winX then
		squareObj.state.hor = false
		playSound(clicksfx)
		changeBgColor()
	else if squareObj.x <= 5 then
		squareObj.state.hor = true
		playSound(clicksfx)
		changeBgColor()
	end
	end
	if squareObj.y + squareObj.h + 5 > winY then
		squareObj.state.ver = false
		playSound(clicksfx)
		changeBgColor()
	else if squareObj.y <= 5 then
		squareObj.state.ver = true
		playSound(clicksfx)
		changeBgColor()
	end
	end
end
