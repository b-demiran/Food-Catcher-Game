local Food = {}

function Food:new(x, y, image)
    local obj = {
        x = x,
        y = -90,
        image = image,
        width = 75,
        height = 75,
        caught = false
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Food:update(dt)
    if not self.caught then
            self.y = self.y + 300 * dt
    end

    if gameMode == "start" then
        self.y = -90
        self.x = love.math.random(0, love.graphics.getWidth() - 70)
    end

end

function Food:draw()
    if not self.caught then 
        love.graphics.draw(self.image, self.x, self.y)
    end
end

return Food