function GenerateQuadsTiles(spriteSheet)
    local output = {}
    local count = 1
    local sheetWidth = spriteSheet:getWidth() / TILE_SIZE
    for x = 0, sheetWidth do
        output[count] = love.graphics.newQuad(x, 0, TILE_SIZE, TILE_SIZE, spriteSheet:getDimensions())
        count = count + 1
    end
    return output
end
