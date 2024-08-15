local Food = require("Scripts.Foods.Food")
local Egg = Food:new()

function Egg:new(x, y)
    local image = love.graphics.newImage("Assets/Sprites/egg.png")
    local obj = Food:new(x, y, image)
    return obj
end

return Egg
