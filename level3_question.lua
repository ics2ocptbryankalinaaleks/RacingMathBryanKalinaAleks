-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Allison
-- Date: May 16, 2017
-- Description: This is the level 1 screen of the game. the charater can be dragged to move
--If character goes off a certain araea they go back to the start. When a user interactes
--with piant a trivia question will come up. they will have a limided time to click on the answer
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level3_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene


local answerPosition = 1
local bkg
local cover

local answerText
local wrongText1
local wrongText2
local wrongText3

local randomQuestion

local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7

local userAnswer
local textTouched = false


-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
local function BackToLevel3() 
    composer.hideOverlay("crossFade", 400 )
  
    ResumeLevel3()
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswerText(touch)
    
    if (touch.phase == "ended") then

        BackToLevel3()
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongText1(touch)
    
    if (touch.phase == "ended") then
        
        BackToLevel3()  
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongText2(touch)
    
    if (touch.phase == "ended") then

        BackToLevel3()
        
    end 
end

local function TouchListenerWrongText3(touch)
    
    if (touch.phase == "ended") then

        BackToLevel3()
        
    end 
end


--adding the event listeners 
local function AddTextListeners ( )
    answerText:addEventListener( "touch", TouchListenerAnswerText )
    wrongText1:addEventListener( "touch", TouchListenerWrongText1)
    wrongText2:addEventListener( "touch", TouchListenerWrongText2)
    wrongText3:addEventListener( "touch", TouchListenerWrongText3)

end

--removing the event listeners
local function RemoveTextListeners()
    answerText:removeEventListener( "touch", TouchListenerAnswerText )
    wrongText1:removeEventListener( "touch", TouchListenerWrongText1)
    wrongText2:removeEventListener( "touch", TouchListenerWrongText2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongText3)
end


local function AskQuestion()
    randomQuestion = math.random(1,20)

    if (randomQuestion == 1) then
        questionText.text = "What are the three main parts of a plant"
        answerText.text = "roots, leaves, stem"
        wrongText1.text = "roots, stem, branches"
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 2) then
        questionText.text = "What do roots do"
        answerText.text = "soak up food and water"
        wrongText1.text = "grow food"
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 3) then
        questionText.text = "What do plants do to help animals"
        answerText.text = "provide food for certain animals"
        wrongText1.text = "release carbon dioxide animals need"
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 4) then
        questionText.text = "Some plants grow bulbs, what do the bubls do"
        answerText.text = "turn into flowers"
        wrongText1.text = "turn into seeds"
        wrongText2.text = "turn into trees"
        wrongText3.text = "turn into grass"
    elseif (randomQuestion = 5) then
        questionText.text = "how does the sun help plants"
        answerText.text = "turn the energy from the sun into food"
        wrongText1.text = "uses the enegy to create pollen"
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?" 
    elseif (randomQuestion = 6) then
        questionText.text = "What structures are NOT natural"
        answerText.text = "pyramid"
        wrongText1.text = "mountain"
        wrongText2.text = "tree"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 7) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 8) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 9) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 10) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 11) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"        
    elseif (randomQuestion = 12) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 13) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 14) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 15) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 16) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 17) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 18) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 19) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"
    elseif (randomQuestion = 20) then
        questionText.text = ""
        answerText.text = ""
        wrongText1.text = ""
        wrongText2.text = "?,?,?"
        wrongText3.text = "?,?,?"

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


    -- Insert background image into the scene group in order to ONLY be associated with this scene

    -- create the question text and answer text objects
    -- set the question text
    questionText = display.newText("",display.contentCenterX, display.contentCenterY*3/8, Arial, 75)




end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then


    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        bkgSoundChannel = audio.play( bkgSound, {channel=1, loops=-1})
        -- Ask a question
        AskQuestion()

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