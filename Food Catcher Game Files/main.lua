_G.love = require("love")
local Plate = require("Plate")
local Burger = require("Burger")
local Burrito = require("Burrito")
local Hotdog = require("Hotdog")
local Pizza = require("Pizza")
local Taco = require("Taco")
local Pie = require("Pie")
local Cake = require("Cake")
local Egg = require("Egg")
local Food = require("Food")

local foods = {}
local spawnTimer = 0
local spawnInterval = 1

WINDOW_HEIGHT = 750
WINDOW_WIDTH = 1000

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    _G.start = love.graphics.newImage("Backdrops/start.png")
    _G.play = love.graphics.newImage("Backdrops/play.png")
    _G.gameOver = love.graphics.newImage("Backdrops/gameOver.png")
    _G.scoreBoard = love.graphics.newImage("Backdrops/scoreBoard.png")
    _G.plateSprite = love.graphics.newImage("Sprites/plate.png")

    _G.lives6 = love.graphics.newImage("Heart/Heart6.png")
    _G.lives5 = love.graphics.newImage("Heart/Heart5.png")
    _G.lives4 = love.graphics.newImage("Heart/Heart4.png")
    _G.lives3 = love.graphics.newImage("Heart/Heart3.png")
    _G.lives2 = love.graphics.newImage("Heart/Heart2.png")
    _G.lives1 = love.graphics.newImage("Heart/Heart1.png")

    _G.scoreFont = love.graphics.newFont("Font/pixel.regular.ttf", 50) 
    love.graphics.setFont(scoreFont)

    backgroundAudio = love.audio.newSource("Audio/Ludum Dare 38 - Track 1.wav", "stream")
    backgroundAudio:setVolume(0.4)
    pickUpSound = love.audio.newSource("Audio/GameSFX/Retro PickUp Coin 04.wav", "static")
    pickUpSound:setVolume(0.15)
    dropSound = love.audio.newSource("Audio/GameSFX/Retro Event Wrong Simple 03.wav", "static")
    dropSound:setVolume(2.1)
    gameOverSound = love.audio.newSource("Audio/GameSFX/Retro Negative Short 23.wav", "static")
    gameOverSound:setVolume(0.4)

    _G.score = 0
    _G.lives = 6

    _G.plate = Plate.new(500)

    _G.gameMode = "start"
    love.audio.play(backgroundAudio)
end

function love.keypressed(key)
    if key == "space" and gameMode == "gameOver" or gameMode == "start" then
        lives = 6
        score = 0
        _G.gameMode = "play"
    end
    if key == "escape" then
        _G.gameMode = "start"
    end
end

function love.update(dt)
    plate:update(dt)

    for i = #foods, 1, -1 do
        local food = foods[i]
        food:update(dt)

        if checkCollision(food, plate) then
            Food.caught = true
            _G.score = score + 1
            table.remove(foods, i)

            if gameMode == "play" then
                love.audio.play(pickUpSound)
            end
        end

        if food.y > WINDOW_HEIGHT then
            table.remove(foods, i)
            _G.lives = lives - 1

            if gameMode == "play" then
                love.audio.play(dropSound)
            end
            if lives == 0 then 
                love.audio.play(gameOverSound)
            end
        end
    end


    spawnTimer = spawnTimer + dt
    if spawnTimer >= 1 then
        spawnFood()
        resetSpawnTimer()
    end

    if gameMode == "start" then
        _G.score = 0
        _G.lives = 6
    end

    for _, food in ipairs(foods) do
        food:update(dt)
    end

    _G.scoreX = 135

    if score >= 10 then
        _G.scoreX = 120
    end
    if score >= 20 then
        _G.scoreX = 112
    end
    if score >=100 then
        _G.scoreX = 105
    end
    if score >= 120 then
        _G.scoreX = 100
    end
    if score >= 200 then
        _G.scoreX = 90
    end

    if lives == 0 then
        _G.gameMode = "gameOver"
    end
end

function checkCollision(food, plate)
    local foodLeft = food.x
    local foodRight = food.x + food.width
    local foodTop = food.y
    local foodBottom = food.y + food.height

    local plateLeft = plate.x
    local plateRight = plate.x + plate.width
    local plateTop = plate.y
    local plateBottom = plate.y + plate.height

    if foodRight >= plateLeft and foodLeft <= plateRight and foodBottom >= plateTop and foodTop <= plateBottom then
        return true
    else
        return false
    end
end

function spawnFood()
    local foodType = love.math.random(1, 8)
    local food

    if foodType == 1 then
        food = Burger:new(love.math.random(0, love.graphics.getWidth() - 70))
    elseif foodType == 2 then
        food = Burrito:new(love.math.random(0, love.graphics.getWidth() - 70))
    elseif foodType == 3 then
        food = Hotdog:new(love.math.random(0, love.graphics.getWidth() - 70))
    elseif foodType == 4 then
        food = Pizza:new(love.math.random(0, love.graphics.getWidth() - 70))
    elseif foodType == 5 then
        food = Taco:new(love.math.random(0, love.graphics.getWidth() - 70))
    elseif foodType == 6 then
        food = Pie:new(love.math.random(0, love.graphics.getWidth() - 70))
    elseif foodType == 7 then
        food = Cake:new(love.math.random(0, love.graphics.getWidth() - 70))
    elseif foodType == 8 then
        food = Egg:new(love.math.random(0, love.graphics.getWidth() - 70))
    end

    table.insert(foods, food)
end

function resetSpawnTimer()
    spawnTimer = 0
    spawnInterval = 1
end

function love.draw()
    if gameMode == "start" then
        love.graphics.draw(start, 0, 0)

    elseif gameMode == "play" then
        love.graphics.draw(play, 0, 0)
        love.graphics.draw(scoreBoard)
        love.graphics.setColor(72/255, 60/255, 50/255, 1)
        love.graphics.print(tostring(score), scoreX, 45)
        love.graphics.setColor(1, 1, 1)

        local livesX = 87
        local livesY = 125

        if lives == 6 then
            love.graphics.draw(lives6, livesX, livesY)
        elseif lives == 5 then
            love.graphics.draw(lives5, livesX, livesY)
        elseif lives == 4 then
            love.graphics.draw(lives4, livesX, livesY)
        elseif lives == 3 then
            love.graphics.draw(lives3, livesX, livesY)
        elseif lives == 2 then
            love.graphics.draw(lives2, livesX, livesY)
        elseif lives == 1 then
            love.graphics.draw(lives1, livesX, livesY)
        end

        plate:draw()
        for _, food in ipairs(foods) do
            food:draw()
        end

    elseif gameMode == "gameOver" then
        love.graphics.draw(gameOver, 0, 0)
    end
end