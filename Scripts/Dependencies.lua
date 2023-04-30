Class = require 'Libraries/class'
push = require 'Libraries/push'
Timer = require 'Libraries/knife/timer'

require 'Scripts/Constants'
require 'Scripts/Util'
require 'Scripts/StateMachine'

require 'Scripts/States/BaseState'
require 'Scripts/States/MenuState'

gTextures = {
    ['background'] = love.graphics.newImage('Assets/Graphics/Background.png'),
    ['tiles'] = love.graphics.newImage('Assets/Graphics/Tiles.png'),
    ['indicator'] = love.graphics.newImage('Assets/Graphics/Indicator.png')
}

gFonts = {
    ['medium'] = love.graphics.newFont('Assets/Fonts/Font.ttf', 14, 'mono', 1),
    ['large'] = love.graphics.newFont('Assets/Fonts/Font.ttf', 28, 'mono', 1)
}

gSounds = {
    ['select'] = love.audio.newSource('Assets/Sounds/Select.wav', 'static')
}

gTileFrames = GenerateQuadsTiles(gTextures['tiles'])