-----------------------------------------------------------------------------------------
--
-- level3_screen.lua
-- Created by: Bryan R
-- Date: 
-- Description: this is the level three question
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

local X1 = display.contentWidth*1/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5/7

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
--checking to see if the user pressed the right answer and bring them back to level 3
local function TouchListenerAnswerText(touch)
    
    if (touch.phase == "ended") then

        BackToLevel3()
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 3
local function TouchListenerWrongText1(touch)
    
    if (touch.phase == "ended") then
        lives = lives - 1

        BackToLevel3()  
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 3
local function TouchListenerWrongText2(touch)
    
    if (touch.phase == "ended") then
        lives = lives - 1

        BackToLevel3()
        
    end 
end

local function TouchListenerWrongText3(touch)
    
    if (touch.phase == "ended") then
        lives = lives - 1

        BackToLevel3()
        
    end 
end


--adding the event listeners 
local function AddTextListeners()
    answerText:addEventListener( "touch", TouchListenerAnswerText)
    wrongText1:addEventListener( "touch", TouchListenerWrongText1)
    wrongText2:addEventListener( "touch", TouchListenerWrongText2)
    wrongText3:addEventListener( "touch", TouchListenerWrongText3)

end

--removing the event listeners
local function RemoveTextListeners()
    answerText:removeEventListener( "touch", TouchListenerAnswerText)
    wrongText1:removeEventListener( "touch", TouchListenerWrongText1)
    wrongText2:removeEventListener( "touch", TouchListenerWrongText2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongText3)
end


local function AskQuestion()
    randomQuestion = math.random(1,10)

    if (randomQuestion == 1) then
        questionText.text = "What are the three main parts\nof a plant?"
        answerText.text = "Roots, leaves,\n stem"
        wrongText1.text = "Roots, stem,\n branches"
        wrongText2.text = "Roots, trunk,\n leaves"
        wrongText3.text = "Roots, trunk,\n branches"

    elseif (randomQuestion == 2) then
        questionText.text = "What do roots do?"
        answerText.text = "Soak up food\nand water"
        wrongText1.text = "Grow food"
        wrongText2.text = "Complete\nphotosynthesis"
        wrongText3.text = "Nothing"

    elseif (randomQuestion == 3) then
        questionText.text = "What do plants do to help animals?"
        answerText.text = "provide food for\ncertain animals"
        wrongText1.text = "release carbon\ndioxide animals need"
        wrongText2.text = "release pollen\nfor animals"
        wrongText3.text = "all of the above"

    elseif (randomQuestion == 4) then
        questionText.text = "Some plants grow bulbs,\nwhat do the bubls do?"
        answerText.text = "Grow into flowers"
        wrongText1.text = "Grow into seeds"
        wrongText2.text = "Grow into trees"
        wrongText3.text = "Grow into grass"

    elseif (randomQuestion == 5) then
        questionText.text = "How does the sun help plants?"
        answerText.text = "Turn the energy\nfrom the sun into food"
        wrongText1.text = "Uses the enegy\nto create pollen"
        wrongText2.text = "Uses the energy\nfrom the sun to make water"
        wrongText3.text = "It doesn't" 

    elseif (randomQuestion == 6) then
        questionText.text = "What structures are NOT natural?"
        answerText.text = "Pyramid"
        wrongText1.text = "Mountain"
        wrongText2.text = "Tree"
        wrongText3.text = "Nests"

    elseif (randomQuestion == 7) then
        questionText.text = "What do roses have on the stem?"
        answerText.text = "Thorns"
        wrongText1.text = "Roots"
        wrongText2.text = "Petals"
        wrongText3.text = "Flower head"

    elseif (randomQuestion == 8) then
        questionText.text = "What is the female\nreproductive part of a plant?"
        answerText.text = "Pistil"
        wrongText1.text = "Overy"
        wrongText2.text = "Stem"
        wrongText3.text = "Leaves"

    elseif (randomQuestion == 9) then
        questionText.text = "Which one is a natural structure?"
        answerText.text = "Cave"
        wrongText1.text = "Totem pole"
        wrongText2.text = "Moai"
        wrongText3.text = "Building"

    elseif (randomQuestion == 10) then
        questionText.text = "How do animals help plants?"
        answerText.text = "all of them"
        wrongText1.text = "Animals eat weeds\nthat take\nnutrients from\nother plants"
        wrongText2.text = "Animals release\ncarbon dioxide\nplants need"
        wrongText3.text = "Animals distribute\npollen for flowers"

    elseif (randomQuestion == 11) then
        questionText.text = "What is the process called that\nconverts light energy\ninto chemical energy?"
        answerText.text = "Photosynthesis"
        wrongText1.text = "Chemical change"
        wrongText2.text = "Light change"
        wrongText3.text = "Conversion"  

    elseif (randomQuestion == 12) then
        questionText.text = "What is the yellow\ncenter of a daisy called?"
        answerText.text = "Flower head"
        wrongText1.text = "Flower center"
        wrongText2.text = "Center head"
        wrongText3.text = "Center flower "

    elseif (randomQuestion == 13) then
        questionText.text = "What is the most common amount\nof leaves four leaf clovers have?"
        answerText.text = "3"
        wrongText1.text = "4"
        wrongText2.text = "5"
        wrongText3.text = "6"

    elseif (randomQuestion == 14) then
        questionText.text = "What is the process called\nwhen pollen is moved from one plant to another?"
        answerText.text = "Pollination "
        wrongText1.text = "Pollen moving"
        wrongText2.text = "Plantation"
        wrongText3.text = "Pollening"

    elseif (randomQuestion == 15) then
        questionText.text = "Which structure is made by animals?"
        answerText.text = "Dam"
        wrongText1.text = "Bridge "
        wrongText2.text = "CN tower"
        wrongText3.text = "Tree"

    elseif (randomQuestion == 16) then
        questionText.text = "Which structure is NOT made by animals?"
        answerText.text = "Pond"
        wrongText1.text = "Beehive"
        wrongText2.text = "Nests"
        wrongText3.text = "Webs"

    elseif (randomQuestion == 17) then
        questionText.text = "What plant doesn't grow from a seed?"
        answerText.text = "Fern"
        wrongText1.text = "Sunflower"
        wrongText2.text = "Cucumber"
        wrongText3.text = "Pumpkin"

    elseif (randomQuestion == 18) then
        questionText.text = "What plant doesn't grows from bulbs?"
        answerText.text = "Tulips"
        wrongText1.text = "Lillies "
        wrongText2.text = "Onion"
        wrongText3.text = "Orange "

    elseif (randomQuestion == 19) then
        questionText.text = " What plant grows from bulbs?"
        answerText.text = "Shallots "
        wrongText1.text = "Apples"
        wrongText2.text = "Carrots"
        wrongText3.text = "Lettuce"

    elseif (randomQuestion == 20) then
        questionText.text = " What plant grows from seeds?"
        answerText.text = "Carrots"
        wrongText1.text = "Rose"
        wrongText2.text = "Onion"
        wrongText3.text = "Potato"
    end

end

local function PositionAnswers()

    --creating random start position in a cretain area
    answerPosition = math.random(1,4)

    if (answerPosition == 1) then

        answerText.x = X1
        answerText.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2

        
    elseif (answerPosition == 2) then

        answerText.x = X2
        answerText.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y1

        wrongText3.x = X1
        wrongText3.y = Y2

    elseif (answerPosition == 3) then

        answerText.x = X2
        answerText.y = Y1
            
        wrongText1.x = X1
        wrongText1.y = Y2
            
        wrongText2.x = X2
        wrongText2.y = Y2

        wrongText3.x = X1
        wrongText3.y = Y1

    elseif (answerPosition == 4) then

        answerText.x = X1
        answerText.y = Y2
            
        wrongText1.x = X2
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y1
        
            
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
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(96/255, 96/255, 96/255)

    -- create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 50)

    -- create the answer text object & wrong answer text objects
    answerText = display.newText("", X1, Y2, Arial, 35)
    answerText.anchorX = 0
    wrongText1 = display.newText("", X2, Y2, Arial, 35)
    wrongText1.anchorX = 0
    wrongText2 = display.newText("", X1, Y1, Arial, 35)
    wrongText2.anchorX = 0
    wrongText3 = display.newText("", X2, Y1, Arial, 35)
    wrongText3.anchorX = 0    

    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(questionText)
    sceneGroup:insert(answerText)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)


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
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        AskQuestion()
        PositionAnswers()
        AddTextListeners()
    end

end --function scene:show( event )

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
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        RemoveTextListeners()
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
