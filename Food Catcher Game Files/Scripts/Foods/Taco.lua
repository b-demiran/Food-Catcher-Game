local Food = require("Scripts.Foods.Food")
local Taco = Food:new()

function Taco:new(x, y)
    local image = love.graphics.newImage("Assets/Sprites/taco.png")
    local obj = Food:new(x, y, image)
    return obj
end

return Taco
