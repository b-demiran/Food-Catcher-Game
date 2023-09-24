local Food = require("Food")
local Taco = Food:new()

function Taco:new(x, y)
    local image = love.graphics.newImage("Sprites/taco.png")
    local obj = Food:new(x, y, image)
    return obj
end

return Taco