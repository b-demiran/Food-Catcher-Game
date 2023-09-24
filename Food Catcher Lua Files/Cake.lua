local Food = require("Food")
local Cake = Food:new()

function Cake:new(x, y)
    local image = love.graphics.newImage("Sprites/cake.png")
    local obj = Food:new(x, y, image)
    return obj
end



return Cake