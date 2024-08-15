local Food = require("Scripts.Foods.Food")
local Burger = Food:new()

function Burger:new(x, y)
    local image = love.graphics.newImage("Assets/Sprites/burger.png")
    local obj = Food:new(x, y, image)
    return obj
end

return Burger
