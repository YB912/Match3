MenuState = Class { __includes = BaseState }

function MenuState:enter()
    self.highlightedMenuItem = 1

    self.transitionAlpha = 0

    self.blockInput = false
end

function MenuState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if not self.blockInput then
        if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
            self.highlightedMenuItem = self.highlightedMenuItem == 1 and 2 or 1
            gSounds['select']:stop()
            gSounds['select']:play()
        end 
        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
            if self.highlightedMenuItem == 1 then
                -- Transition to the ready state
            else
                love.event.quit()
            end

            self.blockInput = true
        end
    end
    Timer.update(dt)
end

function MenuState:render()
    love.graphics.setColor(0, 0, 0, 128 / 255)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    self:drawMenu()
end

function MenuState:drawMenu()
    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("CS50G\nMatch 3", 0, VIRTUAL_HEIGHT / 2 - 55, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])

    if self.highlightedMenuItem == 1 then
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(gTextures['indicator'], VIRTUAL_WIDTH / 2 + 20, VIRTUAL_HEIGHT / 2 + 22)
    else
        love.graphics.setColor(0, 0, 0, 1)
    end
    love.graphics.printf('Start', 0, VIRTUAL_HEIGHT / 2 + 15, VIRTUAL_WIDTH, 'center')

    if self.highlightedMenuItem == 2 then
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(gTextures['indicator'], VIRTUAL_WIDTH / 2 + 15, VIRTUAL_HEIGHT / 2 + 42)
    else
        love.graphics.setColor(0, 0, 0, 1)
    end
    love.graphics.printf('Quit', 0, VIRTUAL_HEIGHT / 2 + 35, VIRTUAL_WIDTH, 'center')
end
