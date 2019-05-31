-----------------------------------------------------------------------------------------
-- level2_screen.lua
-- Created by: Kalina Dunne Farrell
-- Date: May 23, 2019
-- Description: This is the level 2 screen of the game. (Art)
-----------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )



-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local questionNumber
local textSize = 50

-- cars
local logoCar
local car1
local car2
local car3

-- moves the user's car
local carsAreMoving = 0
-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
-- scrollspeeds

scrollSpeedLogo = 1
scrollSpeedCar1 = 1.2
scrollSpeedCar2 = 1.1
scrollSpeedCar3 = 1
scrollSpeedLogoAfterQuestion1 = 1.3
scrollSpeedLogoAfterQuestion2 = 1.6
scrollSpeedLogoAfterQuestion3 = 1.9
scrollSpeedLogoNew = scrollSpeedLogo
questionsAnsweredLevel2 = 0

-----------------------------------------------------------------------------------------
--LOCAL SOUNDS
-----------------------------------------------------------------------------------------
local bkgSound = audio.loadStream("Sounds/bkgslevel2.mp3")
local bkgSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------


local function MoveLogoCar(event)
    logoCar.x = logoCar.x + scrollSpeedLogo
    --print("logoCar.x" .. logoCar.x)

    if (logoCar.x == 200 
        or (logoCar.x >= 400 and logoCar.x <= 401)
        or (logoCar.x >= 600 and logoCar.x <= 602)
        or logoCar.x >= 900)
    then
        logoCar.x = logoCar.x + 2   -- make 600 more than 602
        carsAreMoving = 0
        Runtime:removeEventListener("enterFrame", MoveLogoCar)

        if (logoCar.x >= 900) then
            composer.gotoScene("you_win")
        else 
            composer.gotoScene("level2_question")
        end
    end
end

-- moves the first car
local function MoveCar1(event)
    if(carsAreMoving == 0) then
        Runtime:removeEventListener("enterFrame", MoveCar1)
    else 
        car1.x = car1.x + scrollSpeedCar1
        --print("car1.x" ..car1.x)
    end
end

-- moves the second car
local function MoveCar2(event)
    if(carsAreMoving == 0) then
        Runtime:removeEventListener("enterFrame", MoveCar2)
    else 
        car2.x = car2.x + scrollSpeedCar2
        --print("car2.x" .. car2.x)
    end
end

-- moves the third car
local function MoveCar3(event)
    if(carsAreMoving == 0) then
        Runtime:removeEventListener("enterFrame", MoveCar3)
    else 
        car3.x = car3.x + scrollSpeedCar3
        --print("car3.x" .. car3.x)
    end
end

-- start to move the cars
local function MoveCars()
    print("level2_screen :: MoveCars")
    Runtime:addEventListener("enterFrame", MoveLogoCar)
    Runtime:addEventListener("enterFrame", MoveCar1)
    Runtime:addEventListener("enterFrame", MoveCar2)
    Runtime:addEventListener("enterFrame", MoveCar3)
    carsAreMoving = 1
end
-------------------------------------------------------------
--Objects
-------------------------------------------------------------
-- cars

--third car (logo car)
    car3 = display.newImage("Images/OrangeCar.png", 0, 0)
    car3.x = 900
    car3.y = 270
    car3:rotate(4)

-- second car (green car)
    car2 = display.newImage("Images/GreenCar.png", 0, 0)
    car2.x = display.contentWidth*-0.5/5
    car2.y = display.contentHeight/1.74
    car2:rotate(-33)

--first car (blue car)
    car1 = display.newImage("Images/BlueCar.png", 0, 0)
    car1.x = display.contentWidth/2
    car1.y = display.contentHeight*4.3/8
    car1:rotate(20)

-- logo car (user's car) (smallest car)
    logoCar = display.newImage("Images/CompanyLogo.png", 0, 0)
    logoCar.x = display.contentWidth*1/8
    logoCar.y = display.contentHeight*5.9/8
    logoCar:scale(0.1, 0.1)

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )
    print("level2_screen :: scene:create( event )")
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level2ScreenKalinaD.F..png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert(car3)
    sceneGroup:insert(car2)
    sceneGroup:insert(car1)
    sceneGroup:insert(logoCar)

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )
    print("level2_screen :: scene:show( event )")
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
        --[[logoCar.x = display.contentWidth*1/8
        logoCar.y = display.contentHeight*5.9/8
        logoCar:scale(0.1, 0.1)]]--
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        bkgSoundChannel = audio.play( bkgSound, {channel=1, loops=-1})
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        -- start the cars
        MoveCars()


        -- Ask a question

    end
end 
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        audio.stop(bkgSoundChannel)
        -- Called immediately after scene goes off screen.
        Runtime:removeEventListener("enterFrame", MovelogoCar)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-----------------------------------------------------------------------------------------

return scene
