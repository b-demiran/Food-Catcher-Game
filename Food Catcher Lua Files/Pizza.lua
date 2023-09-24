local Food = require("Food")
local Pizza = Food:new()

function Pizza:new(x, y)
    local image = love.graphics.newImage("Sprites/pizza.png")
    local obj = Food:new(x, y, image)
    return obj
end


return Pizza