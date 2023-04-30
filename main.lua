love.graphics.setDefaultFilter('nearest', 'nearest')
require 'Scripts/Dependencies'

function love.load()
    love.window.setTitle('Match 3')

    -- Music

    math.randomseed(os.time())
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        resizable = false,
        fullscreen = false,
        canvas = true
    })

    gStateMachine = StateMachine {
        ['menu'] = function() return MenuState() end,
        ['ready'] = function() return ReadyState() end,
        ['play'] = function() return PlayState() end,
        ['gameOver'] = function() return GameOverState() end
    }
    gStateMachine:change('menu')

    backgroundX = 0

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.update(dt)
    backgroundX = backgroundX - BACKGROUND_SCROLL_SPEED * dt
    if backgroundX <= -BACKGROUND_WIDTH + VIRTUAL_WIDTH then
        backgroundX = 0
    end

    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()

    love.graphics.draw(gTextures['background'], backgroundX, 0)

    gStateMachine:render()

    push:finish()
end
