-----------------------------------------------------------------------------------------
-- level3_screen.lua
-- Created by: Bryan R
-- Date: Month Day, Year
-- Description: This is the level 3 screen
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
sceneName = "level3_screen"

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
local logocar

local scrollSpeed = 1.4
local scrollSpeed2 = -1.05
local scrollSpeed3 = -1
local scrollSpeed4 = -1.1

local questionsAnswered = 0
local wrongAnswers = 0

local heart1
local heart2
local heart3


-----------------------------------------------------------------------------------------
-- LOCAL & GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

local function YouLoseTransition()
    composer.gotoScene( "you_lose" )
end

local function YouWinTransition()
    composer.gotoScene( "you_win" )
end

local function AskQuestion()
    -- set all scroll speeds to 0 to stop the car
    scrollSpeed = 0
    scrollSpeed2 = 0
    scrollSpeed3 = 0
    scrollSpeed4 = 0
    composer.showOverlay( "level3_question", { isModal = true, effect = "fade", time = 100})
    
end


local function Movelogocar(event)
    --print ("***Movelogocar: logocar.x = " .. logocar.x)
    logocar.x = logocar.x + scrollSpeed
    if (logocar.x >= 800) then

        Runtime:removeEventListener("enterFrame", Movelogocar)
        print ("***Removed Movelogocar event listener")

        -- Ask another question
        AskQuestion()
        --Runtime:addEventListener("enterFrame", Movelogocar)        
        --print ("***Called Movelogocar event listener")        

    elseif (logocar.x >= 500) then

        Runtime:removeEventListener("enterFrame", Movelogocar)
        print ("***Removed Movelogocar event listener")

        -- Ask another question
        AskQuestion()
        --Runtime:addEventListener("enterFrame", Movelogocar)        
        --print ("***Called Movelogocar event listener")
    elseif (logocar.x >= 300) then

        Runtime:removeEventListener("enterFrame", Movelogocar)
        print ("***Removed Movelogocar event listener")

        -- Ask another question
        AskQuestion()
        --Runtime:addEventListener("enterFrame", Movelogocar)        
        --print ("***Called Movelogocar event listener")

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
  
function ResumeLevel3()
    -- reset the speed
    scrollSpeed = 1.4
    scrollSpeed2 = -1.05
    scrollSpeed3 = -1
    scrollSpeed4 = -1.1

    UpdateHearts()
    questionsAnswered = questionsAnswered + 1
    if (questionsAnswered == 3) then
        YouWinTransition()
    else    
        Runtime:addEventListener("enterFrame", Movelogocar)
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
    bkg_image = display.newImageRect("Images/Level3Screen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    logocar = display.newImage("Images/CompanyLogo.png", 0, 0)        
    logocar.x = 100
    logocar.y = 680
    logocar:scale(0.1, 0.1)

    heart1 = display.newImageRect("Images/heart.png", 80, 80)
    heart1.x = 976
    heart1.y = 50
    heart1.isVisible = true
    
    heart2 = display.newImageRect("Images/heart.png", 80, 80)
    heart2.x = 896
    heart2.y = 50
    heart2.isVisible = true
    
    heart3 = display.newImageRect("Images/heart.png", 80, 80)
    heart3.x = 816
    heart3.y = 50
    heart3.isVisible = true

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )    
    sceneGroup:insert( logocar )
    sceneGroup:insert( heart1 )
    sceneGroup:insert( heart2 )
    sceneGroup:insert( heart3 )

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
        logocar.y = 700
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.


        -- reset the questions answered
        questionsAnswered = 0
        lives=3
        
        -- Ask a question
        UpdateHearts()
        Runtime:addEventListener("enterFrame", Movelogocar)
        print ("***Called Movelogocar event listener")

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
        print ("***Hide: Removed Movelogocar event listener")

        --Runtime:removeEventListener("enterFrame", MovelogocarDown)
        --print ("***Hide: Removed MovelogocarDown event listener")
        --Runtime:removeEventListener("enterFrame", MovelogocarRight)
        --print ("***Hide: Removed MovelogocarRight event listener")
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
