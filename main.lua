WIDTH, HEIGHT = 1280, 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200


local push = require "push"

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    smallFont = love.graphics.newFont('Minecraft.ttf', 15)
    largeFont = love.graphics.newFont('Minecraft.ttf', 32)

    player1Score = 0
    player2Score = 0
    -- playerVars
    player1Y = 10
    player2Y = VIRTUAL_HEIGHT - 30
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


function love.update(dt)
    if love.keyboard.isDown('w') then
        player1Y = player1Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then
        player1Y = player1Y + PADDLE_SPEED * dt
    end

    if love.keyboard.isDown('up') then
        player2Y = player2Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('down') then
        player2Y = player2Y + PADDLE_SPEED * dt
    end

end

function love.draw()
    push:apply('start')
    love.graphics.clear(40/255, 45/255, 55/255, 1)    
    love.graphics.setFont(largeFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 2 - 80)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 2 - 80)
    
    -- paddle 1
    love.graphics.rectangle('fill', 10, player1Y, 5, 20)

    -- paddle 2
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, player2Y, 5, 20)

    -- ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
    push:apply('end')
end
