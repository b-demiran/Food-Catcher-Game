local Food = require("Food")
local Hotdog = Food:new()

function Hotdog:new(x, y)
    local image = love.graphics.newImage("Sprites/hotdog.png")
    local obj = Food:new(x, y, image)
    return obj
end

return Hotdog