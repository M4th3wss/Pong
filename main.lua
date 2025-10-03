WIDTH, HEIGHT = 1280, 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

local push = require "push"

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    smallFont = love.graphics.newFont('Minecraft.ttf', 15)
    largeFont = love.graphics.newFont('Minecraft.ttf', 32)

    player1Score = 0
    player2Score = 0
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WIDTH, HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:apply('start')
    love.graphics.clear(40/255, 45/255, 55/255, 1)    
    love.graphics.setFont(largeFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 2 - 80)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 2 - 80)

    -- paddle 1
    love.graphics.rectangle('fill', 10, 10, 5, 20)

    -- paddle 2
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, VIRTUAL_HEIGHT - 30, 5, 20)

    -- ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
    push:apply('end')
end
