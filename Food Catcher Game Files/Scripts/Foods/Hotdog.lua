local Food = require("Scripts.Foods.Food")
local Hotdog = Food:new()

function Hotdog:new(x, y)
    local image = love.graphics.newImage("Assets/Sprites/hotdog.png")
    local obj = Food:new(x, y, image)
    return obj
end

return Hotdog
