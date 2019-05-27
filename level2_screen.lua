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
local logocar = display.newImage("Images/CompanyLogo.png", 0, 0)
local car1 = display.newImage("Images/BlueCar.png", 0, 0)
local car2 = display.newImage("Images/GreenCar.png", 0, 0)
local car3 = display.newImage("Images/OrangeCar.png", 0, 0)

-- scrollspeeds
local scrollSpeedLogo = 1
local scrollSpeedCar1 = 1
local scrollSpeedCar2 = 1.5
local scrollSpeedCar3 = 2

-- QUESTIONS

-- question1
local question1Text
local question1CorrectAnswer
local question1Answer1
local question1Answer2
local question1Answer3

-- question2
local question2Text
local question2CorrectAnswer
local question2Answer1
local question2Answer2
local question2Answer3

-- question3
local question3Text
local question3CorrectAnswer
local question3Answer1
local question3Answer2
local question3Answer3

-- question4
local question4Text
local question4CorrectAnswer
local question4Answer1
local question4Answer2
local question4Answer3

-- question5
local question5Text
local question5CorrectAnswer
local question5Answer1
local question5Answer2
local question5Answer3

-- question6
local question6Text
local question6CorrectAnswer
local question6Answer1
local question6Answer2
local question6Answer3

-- question7
local question7Text
local question7CorrectAnswer
local question7Answer1
local question7Answer2
local question7Answer3

-- question8
local question8Text
local question8CorrectAnswer
local question8Answer1
local question8Answer2
local question8Answer3

-- question9
local question9Text
local question9CorrectAnswer
local question9Answer1
local question9Answer2
local question9Answer3

-- question10
local question10Text
local question10CorrectAnswer
local question10Answer1
local question10Answer2
local question10Answer3

-- question11
local question11Text
local question11CorrectAnswer
local question11Answer1
local question11Answer2
local question11Answer3

-- question12
local question12Text
local question12CorrectAnswer
local question12Answer1
local question12Answer2
local question12Answer3

-- question13
local question13Text
local question13CorrectAnswer
local question13Answer1
local question13Answer2
local question13Answer3

-- question14
local question14Text
local question14CorrectAnswer
local question14Answer1
local question14Answer2
local question14Answer3

-- question15
local question15Text
local question15CorrectAnswer
local question15Answer1
local question15Answer2
local question15Answer3

-- question16
local question16Text
local question16CorrectAnswer
local question16Answer1
local question16Answer2
local question16Answer3

-- question17
local question17Text
local question17CorrectAnswer
local question17Answer1
local question17Answer2
local question17Answer3

-- question18
local question18Text
local question18CorrectAnswer
local question18Answer1
local question18Answer2
local question18Answer3

-- question19
local question19Text
local question19CorrectAnswer
local question19Answer1
local question19Answer2
local question19Answer3

-- question20
local question20Text
local question20CorrectAnswer
local question20Answer1
local question20Answer2
local question20Answer3

-----------------------------------------------------------------------------------------
--LOCAL SOUNDS
-----------------------------------------------------------------------------------------
local bkgSound = audio.loadStream("Sounds/bkgslevel2.mp3")
local bkgSoundChannel
-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- ask a question
local function AskQuestion()
    -- vhoose out of the possoble 20 questions
    questionNumber = math.random(1, 20)

    -- first question
    if (questionNumber == 1) then
        -- set the question text
        question1Text = display.newText("Click on the Primary Color", 0, 0, Arial, textSize)

        -- set the correct answer text, and text color
        question1CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
        question1CorrectAnswer:setTextColor(1, 0, 0)

        -- 
        question1Answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
        question1Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
        question1Answer3 = display.newText("PINK", 0, 0, Arial, textSize)

    end
end

local function Movelogocar(event)

end

local function MoveCar1(event)

end

local function MoveCar2(event)

end

local function MoveCar3(event)

end

-------------------------------------------------------------
--Objects
-------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

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
        logocar:scale(0.1, 0.1)
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        bkgSoundChannel = audio.play( bkgSound, {channel=1, loops=-1})
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.


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
        audio.stop(bkgSoundChannel)
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
