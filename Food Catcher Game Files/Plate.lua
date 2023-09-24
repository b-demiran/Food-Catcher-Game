local Plate = {}

function Plate.new(x)
    local self = {}

    self.x = x
    self.y = 600
    self.speed = 550
    self.width = 194
    self.height = 107
    

    function self:update(dt)
        local dx = 0
        if love.keyboard.isDown("d") and self.x <= 800 then
            dx = self.speed
        elseif love.keyboard.isDown("right") and self.x <= 800 then
            dx = self.speed
        end
        if love.keyboard.isDown("a") and self.x >= 0 then
            dx = -self.speed
        elseif love.keyboard.isDown("left") and self.x >= 0 then
            dx = -self.speed
        end

        self.x = self.x + dx * dt
    end

    function self:draw()
            love.graphics.draw(plateSprite, self.x, self.y)
    end

    return self
end

return Plate