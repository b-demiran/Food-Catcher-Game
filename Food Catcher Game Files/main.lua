--Dependencies
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

--Game state variables
local foods = {}
local buttons = {}
local spawnTimer = 0
local spawnInterval = 1

--Constants
WINDOW_HEIGHT = 750
WINDOW_WIDTH = 1000


function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    --load images for game states and sprites
    _G.start = love.graphics.newImage("Backdrops/startMenu.png")
    _G.play = love.graphics.newImage("Backdrops/background.png")
    _G.gameOver = love.graphics.newImage("Backdrops/startMenu.png")
    _G.scoreBoard = love.graphics.newImage("Backdrops/scoreBoard.png")
    _G.plateSprite = love.graphics.newImage("Sprites/plate.png")

    --load images for life states
    _G.lives6 = love.graphics.newImage("Heart/Heart6.png")
    _G.lives5 = love.graphics.newImage("Heart/Heart5.png")
    _G.lives4 = love.graphics.newImage("Heart/Heart4.png")
    _G.lives3 = love.graphics.newImage("Heart/Heart3.png")
    _G.lives2 = love.graphics.newImage("Heart/Heart2.png")
    _G.lives1 = love.graphics.newImage("Heart/Heart1.png")

    --load fonts
    _G.scoreFont = love.graphics.newFont("Fonts/pixel.regular.ttf", 50)
    _G.dogica = love.graphics.newFont("Fonts/dogica/TTF/dogicapixelbold.ttf", 35)

    --load sounds
    _G.backgroundAudio = love.audio.newSource("Audio/Ludum Dare 38 - Track 1.wav", "stream")
    _G.backgroundAudio:setVolume(0.4)
    _G.backgroundAudio:setLooping(true)

    _G.pickUpSound = love.audio.newSource("Audio/GameSFX/Retro PickUp Coin 04.wav", "static")
    _G.pickUpSound:setVolume(0.15)

    _G.dropSound = love.audio.newSource("Audio/GameSFX/Retro Event Wrong Simple 03.wav", "static")
    _G.dropSound:setVolume(2.1)

    _G.gameOverSound = love.audio.newSource("Audio/GameSFX/Retro Negative Short 23.wav", "static")
    _G.gameOverSound:setVolume(0.4)

    backgroundAudio:setLooping(true)
    backgroundAudio:play()

    --set initial values
    _G.score = 0
    _G.lives = 6
    _G.gameMode = "start"

    --create plate object
    _G.plate = Plate.new(500)

    --create buttons
    table.insert(buttons, createButton(150, 525, 200, 50, "Start Game", function()
        _G.gameMode = "play"
    end))
    table.insert(buttons, createButton(50, 600, 200, 50, "Exit", function()
        love.event.quit()
    end))
    table.insert(buttons, createButton(770, 10, 200, 50, "Mute", function()
        muteAndUnmute()
    end))
end

--function is called when try again button is pressed in game over menu
function tryAgain()
    _G.gameMode = "play"
    _G.lives = 6
    _G.score = 0
end

function muteAndUnmute()
    if audio == "muted" then
        love.audio.play(backgroundAudio, pickUpSound, dropSound, gameOverSound)
        _G.audio = "playing"
    else
        love.audio.stop(backgroundAudio, pickUpSound, dropSound, gameOverSound)
        _G.audio = "muted"
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then --1 == left click
        for _, btn in ipairs(buttons) do
            --check if the mouse is inside the button's bounds
            if x > btn.x and x < btn.x + btn.width and y > btn.y and y < btn.y + btn.height then
                btn.onClick() --call the button's onClick function
            end
        end
    end
end

function love.update(dt)
    plate:update(dt) --update plate position

    for i = #foods, 1, -1 do
        local food = foods[i]
        food:update(dt) --update each food item

        --check for collision between food and plate
        if checkCollision(food, plate) then
            Food.caught = true
            _G.score = score + 1
            table.remove(foods, i) --remove the item if caught

            if gameMode == "play" then
                pickUpSound:play() --play sound when food is picked up
            end
        end

        --check if the food item has fallen off the screen
        if food.y > WINDOW_HEIGHT then
            table.remove(foods, i)
            _G.lives = lives - 1

            --play sound when food has been dropped
            if gameMode == "play" then
                dropSound:play()
            end
            if lives == 0 then
                gameOverSound:play()
            end
        end
    end

    --spawn food items periodically
    spawnTimer = spawnTimer + dt
    if spawnTimer >= 1 then
        spawnFood()
        resetSpawnTimer()
    end

    --reset score and lives when returning to start menu
    if gameMode == "start" then
        _G.score = 0
        _G.lives = 6
    end

    --update all food items
    for _, food in ipairs(foods) do
        food:update(dt)
    end

    --adjust score display position based on the current score (find new font so this isnt necessary!!!!)
    _G.scoreX = 135
    if score >= 10 then
        _G.scoreX = 120
    end
    if score >= 20 then
        _G.scoreX = 112
    end
    if score >= 100 then
        _G.scoreX = 105
    end
    if score >= 120 then
        _G.scoreX = 100
    end
    if score >= 200 then
        _G.scoreX = 90
    end

    --switch to game over menu when no lives remain
    if lives == 0 then
        _G.gameMode = "gameOver"
    end
end

function checkCollision(food, plate)
    --calculate bounding boxes for the food and plate
    local foodLeft = food.x
    local foodRight = food.x + food.width
    local foodTop = food.y
    local foodBottom = food.y + food.height

    local plateLeft = plate.x
    local plateRight = plate.x + plate.width
    local plateTop = plate.y
    local plateBottom = plate.y + plate.height

    --check if bounding boxes intersect
    if foodRight >= plateLeft and foodLeft <= plateRight and foodBottom >= plateTop and foodTop <= plateBottom then
        return true
    else
        return false
    end
end

--create buttons
function createButton(x, y, width, height, text, onClick)
    return {
        x = x,
        y = y,
        width = width,
        height = height,
        text = text,
        onClick = onClick
    }
end

function spawnFood()
    --randomly select food item to spawn
    local foodType = love.math.random(1, 8)
    local food

    --create new food object based on the selected type
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

    --add new food object to the foods table
    table.insert(foods, food)
end

function resetSpawnTimer()
    spawnTimer = 0
    spawnInterval = 1
end

function love.draw()
    --draw appropriate screen based on current game state
    if gameMode == "start" then
        love.graphics.draw(start, 0, 0)
        --draw buttons
        for _, button in ipairs(buttons) do
            love.graphics.setColor(1, 1, 1)
            love.graphics.setFont(dogica)
            local textWidth = dogica:getWidth(button.text)
            local textHeight = dogica:getHeight(button.text)
            love.graphics.print(button.text, button.x + (button.width - textWidth) / 2,
                button.y + (button.height - textHeight) / 2)
        end
    elseif gameMode == "play" then
        love.graphics.draw(play, 0, 0)
        love.graphics.draw(scoreBoard)
        love.graphics.setColor(72 / 255, 60 / 255, 50 / 255, 1)
        love.graphics.setFont(scoreFont)
        love.graphics.print(tostring(score), scoreX, 45)
        love.graphics.setColor(1, 1, 1)


        local livesX = 87
        local livesY = 125

        --draw correct image based on the current number of lives
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

        --draw the plate and all food items
        plate:draw()
        for _, food in ipairs(foods) do
            food:draw()
        end
    elseif gameMode == "gameOver" then
        love.graphics.draw(gameOver, 0, 0)

        --create and draw buttons
        buttons = {}

        table.insert(buttons, createButton(120, 525, 200, 50, "Try Again", function()
            tryAgain()
        end))
        table.insert(buttons, createButton(50, 600, 200, 50, "Exit", function()
            love.event.quit()
        end))
        table.insert(buttons, createButton(770, 10, 200, 50, "Mute", function()
            muteAndUnmute()
        end))

        for _, button in ipairs(buttons) do
            love.graphics.setColor(1, 1, 1)
            love.graphics.setFont(dogica)
            local textWidth = dogica:getWidth(button.text)
            local textHeight = dogica:getHeight(button.text)
            love.graphics.print(button.text, button.x + (button.width - textWidth) / 2,
                button.y + (button.height - textHeight) / 2)
        end
    end
end
