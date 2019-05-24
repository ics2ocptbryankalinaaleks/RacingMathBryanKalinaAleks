-----------------------------------------------------------------------------------------
-- level3_screen.lua
-- Created by: Bryan R
-- Date: Month Day, Year
-- Description: This is the level 3 screen of the game.
-----------------------------------------------------------------------------------------

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
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image

local logocar = display.newImage("Images/CompanyLogo.png", 0, 0)
local scrollSpeed = 1.4
local scrollSpeed2 = -1.05
local scrollSpeed3 = -1
local scrollSpeed4 = -1.1
-----------------------------------------------------------------------------------------
--LOCAL SOUNDS
-----------------------------------------------------------------------------------------
local bkgSound = audio.loadStream("Sounds/bkgslevel3.mp3")
local bkgSoundChannel
-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()

end

local function MovelogocarRight(event)
    --print ("***MovelogocarRight")
    logocar.x = logocar.x + scrollSpeed
end

local function MovelogocarDown(event)
    --print ("***MovelogocarDown")
    logocar.x = logocar.x - scrollSpeed3
    logocar.y = logocar.y - scrollSpeed4

    if (logocar.x >= 900) then
        logocar:rotate(-45)
        Runtime:removeEventListener("enterFrame", MovelogocarDown)
        --Ask a question
        Runtime:addEventListener("enterFrame", MovelogocarRight)
    end
end



local function Movelogocar(event)
    --print ("***Movelogocar")
    logocar.x = logocar.x + scrollSpeed
    logocar.y = logocar.y + scrollSpeed2

    
    if (logocar.x >= 657) then
        logocar:rotate(90)
        Runtime:removeEventListener("enterFrame", Movelogocar)
        -- Ask another question
        Runtime:addEventListener("enterFrame", MovelogocarDown)
    end
end

-------------------------------------------------------------
--Objects
-------------------------------------------------------------
-- ask about the scroll direction & parabolic path
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

        bkgSoundChannel = audio.play( bkgSound, {channel=1, loops=-1})
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
        Runtime:removeEventListener("enterFrame", Stop)
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