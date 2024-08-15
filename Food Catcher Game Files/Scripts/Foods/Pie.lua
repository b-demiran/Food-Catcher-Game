local Food = require("Scripts.Foods.Food")
local Pie = Food:new()

function Pie:new(x, y)
    local image = love.graphics.newImage("Assets/Sprites/pie.png")
    local obj = Food:new(x, y, image)
    return obj
end

return Pie
