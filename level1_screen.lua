-----------------------------------------------------------------------------------------
-- level1_screen.lua
-- Created by: Aleks K.
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------

lives = 3

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local logocar = display.newImage("Images/CompanyLogo.png", 0, 0)
local scrollSpeed = 1.4
local scrollSpeed2 = -1.05
local scrollSpeed3 = -1
local scrollSpeed4 = -1.1
local questionsAnswered = 0
local wrongAnswers = 0


-----------------------------------------------------------------------------------------
-- LOCAL & GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
    -- set all scroll speeds to 0 to stop the car
    scrollSpeed = 0
    scrollSpeed2 = 0
    scrollSpeed3 = 0
    scrollSpeed4 = 0
    composer.showOverlay( "level1_question", { isModal = true, effect = "fade", time = 100})
    questionsAnswered = questionsAnswered + 1
    if (useranswer ~= answer) then
        lives = lives - 1
    end
end

local function MovelogocarRight(event)
    --print ("***MovelogocarRight: logocar.x = " .. logocar.x)
    logocar.x = logocar.x + scrollSpeed
    logocar:rotate(10)

end

local function MovelogocarDown(event)
    --print ("***MovelogocarDown: logocar.x = " .. logocar.x)
    logocar.x = logocar.x - scrollSpeed3
    logocar.y = logocar.y - scrollSpeed4
    logocar:rotate(-10)


    if (logocar.x >= 900) then
        logocar:rotate(-45)
        Runtime:removeEventListener("enterFrame", MovelogocarDown)
        --Ask a question
        AskQuestion()
        Runtime:addEventListener("enterFrame", MovelogocarRight)
    end
end



local function Movelogocar(event)
    --print ("***Movelogocar: logocar.x = " .. logocar.x)
    logocar.x = logocar.x + scrollSpeed
    logocar.y = logocar.y + scrollSpeed2
    logocar:rotate(10)

    
    if (logocar.x >= 657) then
        logocar:rotate(90)
        Runtime:removeEventListener("enterFrame", Movelogocar)
        -- Ask another question
        AskQuestion()
        Runtime:addEventListener("enterFrame", MovelogocarDown)
    end
end

local function UpdateHearts()
    if (numLives == 3) then
        -- update hearts
        heart1.isVisible = true
        heart2.isVisible = true   
        heart3.isVisible = true
        timer.performWithDelay(200, ReplaceCharacter) 

    elseif (numLives == 2) then
        -- update hearts
        heart1.isVisible = true
        heart2.isVisible = true
        heart3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    elseif (numLives == 1) then
        -- update hearts
        heart1.isVisible = true
        heart2.isVisible = false
        heart3.isVisible = false
        timer.performWithDelay(200, ReplaceCharacter) 

    elseif (numLives == 0) then
        -- update hearts
        heart1.isVisible = false
        heart2.isVisible = false
        heart3.isVisible = false
       timer.performWithDelay(200, YouLoseTransition)
    end
end
-------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-------------------------------------------------------------
  
function ResumeLevel1()
    -- reset the speed
    scrollSpeed = 1.4
    scrollSpeed2 = -1.05
    scrollSpeed3 = -1
    scrollSpeed4 = -1.1

    UpdateHearts()
    
    if (questionsAnswered == 2) then
        -- after getting 2 questions right, go to the you win screen
        composer.gotoScene( "level2_screen" )
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level1Screen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )    
    sceneGroup:insert( logocar )

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
        logocar.x = display.contentWidth*1/8
        logocar.y = display.contentHeight*5.9/8
        logocar:rotate(-45)
        logocar:scale(0.1, 0.1)
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        lives = 3

        -- Ask a question

        Runtime:addEventListener("enterFrame", Movelogocar)

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
        -- Called immediately after scene goes off screen.
        Runtime:removeEventListener("enterFrame", Movelogocar)
        Runtime:removeEventListener("enterFrame", MovelogocarDown)
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