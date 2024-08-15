local Food = require("Scripts.Foods.Food")
local Burrito = Food:new()

function Burrito:new(x, y)
    local image = love.graphics.newImage("Assets/Sprites/burrito.png")
    local obj = Food:new(x, y, image)
    return obj
end

return Burrito
