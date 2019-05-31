-----------------------------------------------------------------------------------------
-- level1_screen.lua
-- Created by: Allison
-- Date: May 16, 2017
-- Description: This is the level 1 screen of the game. the charater can be dragged to move
--If character goes off a certain area they go back to the start. When a user interactes
--with piant a trivia question will come up. they will have a limided time to click on the answer
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
sceneName = "level2_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local questionText
local correctAnswer
local answer1
local answer2
local answer3 

-- 
local bkg
local cover

local textSize = 50

local userAnswer
local textTouched = false

local correct = display.newText("Correct!", 0, 0, Arial, textSize)
correct.x = display.contentCenterX
correct.y = display.contentCenterY - 100
correct:setTextColor(0, 1, 0)
correct.isVisible = false

local incorrect = display.newText("Sorry, that's wrong...", 0, 0, Arial, textSize)
incorrect.x = display.contentCenterX
incorrect.y = display.contentCenterY - 100
incorrect:setTextColor(1, 0, 0)
incorrect.isVisible = false

local textPositionX = display.contentWidth*1/2
local textPositionY = display.contentHeight*2/8

local answerPosition1X = display.contentWidth*1/3.5 
local answerPosition1Y = display.contentHeight*1/2 

local answerPosition2X = display.contentWidth*2.4/3.5 
local answerPosition2Y = display.contentHeight*1/2 

local answerPosition3X = display.contentWidth*1/3.5 
local answerPosition3Y = display.contentHeight*3/4 

local answerPosition4X = display.contentWidth*2.4/3.5 
local answerPosition4Y = display.contentHeight*3/4 

-- event listener variables
local correctAnswer
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3

-- 0 means no question has been asked yet
local questionWasAsked = 0

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function HideCorrect()
    correct.isVisible = false
end

local function HideIncorrect()
    incorrect.isVisible = false
end

-- set the scroll speed of the cars
local function StartCars()

    scrollSpeedLogo = scrollSpeedLogoNew
    scrollSpeedCar1 = 1.4
    scrollSpeedCar2 = 1.2
    scrollSpeedCar3 = 1
end

-- hide objects for question 1
local function HideTextObjectsQuestion()
    questionText.isVisible = false
    correctAnswer.isVisible = false
    answer1.isVisible = false
    answer2.isVisible = false
    answer2.isVisible = false
end

--making transition to next scene
local function BackToLevel2() 
    print("level2_question :: BackToLevel2 : questionWasAsked = " .. questionWasAsked)
    StartCars()

    -- hide all of the text objects
        HideTextObjectsQuestion()


    composer.hideOverlay("crossFade", 400 )
  
    composer.gotoScene( "level2_screen" )
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1, added to the scroll speed
local function TouchListenerAnswer(touch)
    userAnswer = correctAnswer.text
    
    if (touch.phase == "ended") then
        questionsAnsweredLevel2 = questionsAnsweredLevel2 + 1
        
        -- make correct visible, then hide it after 2 seconds
        correct.isVisible = true
        timer.performWithDelay(2000, HideCorrect)

        if (questionsAnsweredLevel2 == 1) then
            scrollSpeedLogoNew = scrollSpeedLogoAfterQuestion1
        elseif (questionsAnsweredLevel2 == 2) then
            scrollSpeedLogoNew = scrollSpeedLogoAfterQuestion2
        elseif (questionsAnsweredLevel2 == 3) then
            scrollSpeedLogoNew = scrollSpeedLogoAfterQuestion3
        end

        BackToLevel2()
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    userAnswer = wrongAnswer1.text
    
    if (touch.phase == "ended") then
        -- make incorrect visible, then hide it after 2 seconds
        incorrect.isVisible = true
        timer.performWithDelay(2000, HideIncorrect)
        
        BackToLevel2()  
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongAnswer2.text
    
    if (touch.phase == "ended") then
        -- make incorrect visible, then hide it after 2 seconds
        incorrect.isVisible = true
        timer.performWithDelay(2000, HideIncorrect)

        BackToLevel2()
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongAnswer3.text
    
    if (touch.phase == "ended") then
        -- make incorrect visible, then hide it after 2 seconds
        incorrect.isVisible = true
        timer.performWithDelay(2000, HideIncorrect)

        BackToLevel2()
        
    end 
end

--adding the event listeners 
local function AddTextListeners()
    correctAnswer:addEventListener( "touch", TouchListenerAnswer )
    print("AddTextListeners()")
    wrongAnswer1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongAnswer2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongAnswer3:addEventListener( "touch", TouchListenerWrongAnswer3)
end

--removing the event listeners
local function RemoveTextListeners()
    correctAnswer:removeEventListener( "touch", TouchListenerAnswer )
    wrongAnswer1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongAnswer2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongAnswer3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end

-- first question 
local function AskQuestion1(sceneGroup)
    -- set the question text
    questionText = display.newText("Click on the primary colour", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    correctAnswer = display.newText("RED", 0, 0, Arial, textSize)
    correctAnswer:setTextColor(1, 0, 0)
    correctAnswer.x = answerPosition1X
    correctAnswer.y = answerPosition1Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
    answer1:setTextColor(0, 1, 0)
    answer1.x = answerPosition2X
    answer1.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = correctAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3
end

-- second question
local function AskQuestion2(sceneGroup)
    -- set the question text
    questionText = display.newText("Which mixture will create brown?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    --set the correct answer text, text color, and position (2nd)
    correctAnswer = display.newText("RED + GREEN", 0, 0, Arial, textSize)
    correctAnswer:setTextColor(1, 0, 0)
    correctAnswer.x = answerPosition4X
    correctAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("PINK + BLUE", 0, 0, Arial, textSize)
    answer1:setTextColor(1, 51/255, 1)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("ORANGE + PURPLE", 0, 0, Arial, textSize)
    answer2:setTextColor(1, 128/255, 0)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("YELLOW + GREEN", 0, 0, Arial, textSize) 
    answer3:setTextColor(1, 1, 0)
    answer3.x = answerPosition2X
    answer3.y = answerPosition2Y


    correctAnswer = correctAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3
end

-- third question
local function AskQuestion3(sceneGroup)
    -- set the question text
    questionText = display.newText("Which color is the opposite of orange?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    correctAnswer = display.newText("BLUE", 0, 0, Arial, textSize)
    correctAnswer:setTextColor(0, 0, 1)
    correctAnswer.x = answerPosition4X
    correctAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("RED", 0, 0, Arial, textSize)
    answer1:setTextColor(1, 0, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("GREEN", 0, 0, Arial, textSize)
    answer3:setTextColor(0, 1, 0)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y

    correctAnswer = correctAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3
end

-- fourth question
local function AskQuestion4(sceneGroup)
    -- set the question text
    questionText = display.newText("Which color is the opposite of purple?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    correctAnswer = display.newText("YELLOW", 0, 0, Arial, textSize)
    correctAnswer:setTextColor(1, 1, 0)
    correctAnswer.x = answerPosition1X
    correctAnswer.y = answerPosition1Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("RED", 0, 0, Arial, textSize)
    answer1:setTextColor(1, 0, 0)
    answer1.x = answerPosition2X
    answer1.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("BLUE", 0, 0, Arial, textSize)
    answer2:setTextColor(0, 0, 1)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = correctAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3
end

-- fifth question
local function AskQuestion5(sceneGroup)
    -- set the question text
    questionText = display.newText("Which mixture will create green?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    correctAnswer = display.newText("YELLOW + BLUE", 0, 0, Arial, textSize)
    correctAnswer:setTextColor(1, 1, 0)
    correctAnswer.x = answerPosition3X
    correctAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("RED + PURPLE", 0, 0, Arial, textSize)
    answer1:setTextColor(1, 0, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("BLUE + RED", 0, 0, Arial, textSize)
    answer2:setTextColor(0, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("RED + YELLOW", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 0, 0)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = correctAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3
end

-- sixth question
local function AskQuestion6(sceneGroup)
    print("AskQuestion6(sceneGroup)")
    -- set the question text
    questionText = display.newText("Which mixture will create purple?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    correctAnswer = display.newText("RED + BLUE", 0, 0, Arial, textSize)
    correctAnswer:setTextColor(1, 0, 0)
    correctAnswer.x = answerPosition4X
    correctAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("RED + GREEN", 0, 0, Arial, textSize)
    answer1:setTextColor(1, 0, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("BLUE + YELLOW", 0, 0, Arial, textSize)
    answer2:setTextColor(0, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("YELLOW + GREEN", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 1, 0)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y

    correctAnswer = correctAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3
end

-- seventh question
local function AskQuestion7(sceneGroup)
    -- set the question text
    questionText = display.newText("Which mixture will create orange?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    correctAnswer = display.newText("YELLOW + RED", 0, 0, Arial, textSize)
    correctAnswer:setTextColor(1, 1, 0)
    correctAnswer.x = answerPosition4X
    correctAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("BLUE + YELLOW", 0, 0, Arial, textSize)
    answer1:setTextColor(0, 0, 1)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the third wrong answer text, text color, and position
    answer2 = display.newText("GREEN + BLUE", 0, 0, Arial, textSize)
    answer2:setTextColor(0, 1, 0)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position green
    answer3 = display.newText("PURPLE + GREEN", 0, 0, Arial, textSize)
    answer3:setTextColor(127/255, 0, 1)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y

    correctAnswer = correctAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3
end

-- eigth question
local function AskQuestion8(sceneGroup)
    -- set the question text
    question8Text = display.newText("Which colour is a secondary colour?", 0, 0, Arial, textSize)
    question8Text:setTextColor(244/255, 244/255, 244/255)
    question8Text.x = textPositionX
    question8Text.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    question8CorrectAnswer = display.newText("GREEN", 0, 0, Arial, textSize)
    question8CorrectAnswer:setTextColor(0, 1, 0)
    question8CorrectAnswer.x = answerPosition3X
    question8CorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    question8Answer1 = display.newText("YELLOW", 0, 0, Arial, textSize)
    question8Answer1:setTextColor(1, 1, 0)
    question8Answer1.x = answerPosition1X
    question8Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question8Answer2 = display.newText("BLUE", 0, 0, Arial, textSize)
    question8Answer2:setTextColor(0, 0, 1)
    question8Answer2.x = answerPosition2X
    question8Answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    question8Answer3 = display.newText("RED", 0, 0, Arial, textSize)
    question8Answer3:setTextColor(1, 0, 0)
    question8Answer3.x = answerPosition4X
    question8Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question8Text)
    sceneGroup:insert(question8CorrectAnswer)
    sceneGroup:insert(question8Answer1)
    sceneGroup:insert(question8Answer2)
    sceneGroup:insert(question8Answer3)

    correctAnswer = question8CorrectAnswer
    wrongAnswer1 = question8Answer1
    wrongAnswer2 = question8Answer2
    wrongAnswer3 = question8Answer3

    questionWasAsked = 8
end

-- ninth question
local function AskQuestion9(sceneGroup)
    -- set the question text
    question9Text = display.newText("Which colour is a secondary colour?", 0, 0, Arial, textSize)
    question9Text:setTextColor(244/255, 244/255, 244/255)
    question9Text.x = textPositionX
    question9Text.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    question9CorrectAnswer = display.newText("PURPLE", 0, 0, Arial, textSize)
    question9CorrectAnswer:setTextColor(127/255, 0, 1)
    question9CorrectAnswer.x = answerPosition2X
    question9CorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    question9Answer1 = display.newText("BLUE", 0, 0, Arial, textSize)
    question9Answer1:setTextColor(0, 0, 1)
    question9Answer1.x = answerPosition1X
    question9Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question9Answer2 = display.newText("YELLOW", 0, 0, Arial, textSize)
    question9Answer2:setTextColor(1, 1, 0)
    question9Answer2.x = answerPosition3X
    question9Answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    question9Answer3 = display.newText("RED", 0, 0, Arial, textSize)
    question9Answer3:setTextColor(1, 0, 0)
    question9Answer3.x = answerPosition4X
    question9Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question9Text)
    sceneGroup:insert(question9CorrectAnswer)
    sceneGroup:insert(question9Answer1)
    sceneGroup:insert(question9Answer2)
    sceneGroup:insert(question9Answer3)

    correctAnswer = question9CorrectAnswer
    wrongAnswer1 = question9Answer1
    wrongAnswer2 = question9Answer2
    wrongAnswer3 = question9Answer3

    questionWasAsked = 9
end

-- tenth question
local function AskQuestion10(sceneGroup)
    -- set the question text
    question10Text = display.newText("Which colour is a secondary colour?", 0, 0, Arial, textSize)
    question10Text:setTextColor(244/255, 244/255, 244/255)
    question10Text.x = textPositionX
    question10Text.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    question10CorrectAnswer = display.newText("ORANGE", 0, 0, Arial, textSize)
    question10CorrectAnswer:setTextColor(1, 128/255, 0)
    question10CorrectAnswer.x = answerPosition4X
    question10CorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    question10Answer1 = display.newText("BLUE", 0, 0, Arial, textSize)
    question10Answer1:setTextColor(0, 0, 1)
    question10Answer1.x = answerPosition1X
    question10Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question10Answer2 = display.newText("RED", 0, 0, Arial, textSize)
    question10Answer2:setTextColor(1, 0, 0)
    question10Answer2.x = answerPosition2X
    question10Answer2.y = answerPosition2Y

    -- set the third wrong answer text, 2text color, and position
    question10Answer3 = display.newText("YELLOW", 0, 0, Arial, textSize)
    question10Answer3:setTextColor(1, 1, 0)
    question10Answer3.x = answerPosition3X
    question10Answer3.y = answerPosition3Y

    -- insert the text objects into this scene
    sceneGroup:insert(question10Text)
    sceneGroup:insert(question10CorrectAnswer)
    sceneGroup:insert(question10Answer1)
    sceneGroup:insert(question10Answer2)
    sceneGroup:insert(question10Answer3)

    correctAnswer = question10CorrectAnswer
    wrongAnswer1 = question10Answer1
    wrongAnswer2 = question10Answer2
    wrongAnswer3 = question10Answer3

    questionWasAsked = 10
end

-- eleventh question
local function AskQuestion11(sceneGroup)
    -- set the question text
    question11Text = display.newText("Click on the primary color", 0, 0, Arial, textSize)
    question11Text:setTextColor(244/255, 244/255, 244/255)
    question11Text.x = textPositionX
    question11Text.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    question11CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question11CorrectAnswer:setTextColor(1, 0, 0)
    question11CorrectAnswer.x = answerPosition3X
    question11CorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    question11Answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
    question11Answer1:setTextColor(0, 1, 0)
    question11Answer1.x = answerPosition1X
    question11Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question11Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question11Answer2:setTextColor(127/255, 0, 1)
    question11Answer2.x = answerPosition2X
    question11Answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    question11Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question11Answer3:setTextColor(1, 51/255, 1)
    question11Answer3.x = answerPosition4X
    question11Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question11Text)
    sceneGroup:insert(question11CorrectAnswer)
    sceneGroup:insert(question11Answer1)
    sceneGroup:insert(question11Answer2)
    sceneGroup:insert(question11Answer3)

    correctAnswer = question11CorrectAnswer
    wrongAnswer1 = question11Answer1
    wrongAnswer2 = question11Answer2
    wrongAnswer3 = question11Answer3

    questionWasAsked = 11
end

-- twelveth question
local function AskQuestion12(sceneGroup)
    -- set the question text
    question12Text = display.newText("Which colour is a primary colour?", 0, 0, Arial, textSize)
    question12Text:setTextColor(244/255, 244/255, 244/255)
    question12Text.x = textPositionX
    question12Text.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    question12CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question12CorrectAnswer:setTextColor(1, 0, 0)
    question12CorrectAnswer.x = answerPosition1X
    question12CorrectAnswer.y = answerPosition1Y

    -- set the first wrong answer text, text color, and position
    question12Answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
    question12Answer1:setTextColor(0, 1, 0)
    question12Answer1.x = answerPosition2X
    question12Answer1.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position
    question12Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question12Answer2:setTextColor(127/255, 0, 1)
    question12Answer2.x = answerPosition3X
    question12Answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    question12Answer3 = display.newText("BLACK", 0, 0, Arial, textSize)
    question12Answer3:setTextColor(0, 0, 0)
    question12Answer3.x = answerPosition4X
    question12Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question12Text)
    sceneGroup:insert(question12CorrectAnswer)
    sceneGroup:insert(question12Answer1)
    sceneGroup:insert(question12Answer2)
    sceneGroup:insert(question12Answer3)

    correctAnswer = question12CorrectAnswer
    wrongAnswer1 = question12Answer1
    wrongAnswer2 = question12Answer2
    wrongAnswer3 = question12Answer3

    questionWasAsked = 12
end

-- thirteenth question
local function AskQuestion13(sceneGroup)
    -- set the question text
    question13Text = display.newText("Which colour is the opposite colour of red?", 0, 0, Arial, textSize)
    question13Text:setTextColor(244/255, 244/255, 244/255)
    question13Text.x = textPositionX
    question13Text.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    question13CorrectAnswer = display.newText("GREEN", 0, 0, Arial, textSize)
    question13CorrectAnswer:setTextColor(0, 1, 0)
    question13CorrectAnswer.x = answerPosition3X
    question13CorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    question13Answer1 = display.newText("YELLOW", 0, 0, Arial, textSize)
    question13Answer1:setTextColor(1, 1, 0)
    question13Answer1.x = answerPosition1X
    question13Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question13Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question13Answer2:setTextColor(127/255, 0, 1)
    question13Answer2.x = answerPosition2X
    question13Answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    question13Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question13Answer3:setTextColor(1, 51/255, 1)
    question13Answer3.x = answerPosition4X
    question13Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question13Text)
    sceneGroup:insert(question13CorrectAnswer)
    sceneGroup:insert(question13Answer1)
    sceneGroup:insert(question13Answer2)
    sceneGroup:insert(question13Answer3)

    correctAnswer = question13CorrectAnswer
    wrongAnswer1 = question13Answer1
    wrongAnswer2 = question13Answer2
    wrongAnswer3 = question13Answer3

    questionWasAsked = 13
end

-- fourteenth question
local function AskQuestion14(sceneGroup)
    -- set the question text
    question14Text = display.newText("Which colour is the opposite colour of blue?", 0, 0, Arial, textSize)
    question14Text:setTextColor(244/255, 244/255, 244/255)
    question14Text.x = textPositionX
    question14Text.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    question14CorrectAnswer = display.newText("ORANGE", 0, 0, Arial, textSize)
    question14CorrectAnswer:setTextColor(1, 128/255, 0)
    question14CorrectAnswer.x = answerPosition2X
    question14CorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    question14Answer1 = display.newText("YELLOW", 0, 0, Arial, textSize)
    question14Answer1:setTextColor(1, 1, 0)
    question14Answer1.x = answerPosition4X
    question14Answer1.y = answerPosition4Y

    -- set the second wrong answer text, text color, and position
    question14Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question14Answer2:setTextColor(127/255, 0, 1)
    question14Answer2.x = answerPosition3X
    question14Answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    question14Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question14Answer3:setTextColor(1, 51/255, 1)
    question14Answer3.x = answerPosition1X
    question14Answer3.y = answerPosition1Y

    -- insert the text objects into this scene
    sceneGroup:insert(question14Text)
    sceneGroup:insert(question14CorrectAnswer)
    sceneGroup:insert(question14Answer1)
    sceneGroup:insert(question14Answer2)
    sceneGroup:insert(question14Answer3)

    correctAnswer = question14CorrectAnswer
    wrongAnswer1 = question14Answer1
    wrongAnswer2 = question14Answer2
    wrongAnswer3 = question14Answer3

    questionWasAsked = 14
end

-- fifteenth question
local function AskQuestion15(sceneGroup)
    -- set the question text
    question15Text = display.newText("Which colour is the opposite colour of green?", 0, 0, Arial, textSize)
    question15Text:setTextColor(244/255, 244/255, 244/255)
    question15Text.x = textPositionX
    question15Text.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    question15CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question15CorrectAnswer:setTextColor(1, 0, 0)
    question15CorrectAnswer.x = answerPosition2X
    question15CorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    question15Answer1 = display.newText("BLUE", 0, 0, Arial, textSize)
    question15Answer1:setTextColor(0, 0, 1)
    question15Answer1.x = answerPosition1X
    question15Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question15Answer2 = display.newText("ORANGE", 0, 0, Arial, textSize)
    question15Answer2:setTextColor(1, 128/255, 0)
    question15Answer2.x = answerPosition3X
    question15Answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    question15Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question15Answer3:setTextColor(1, 51/255, 1)
    question15Answer3.x = answerPosition4X
    question15Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question15Text)
    sceneGroup:insert(question15CorrectAnswer)
    sceneGroup:insert(question15Answer1)
    sceneGroup:insert(question15Answer2)
    sceneGroup:insert(question15Answer3)

    correctAnswer = question15CorrectAnswer
    wrongAnswer1 = question15Answer1
    wrongAnswer2 = question15Answer2
    wrongAnswer3 = question15Answer3

    questionWasAsked = 15
end

-- sixteenth question
local function AskQuestion16(sceneGroup)
    -- set the question text
    question16Text = display.newText("Which mixture will create pink?", 0, 0, Arial, textSize)
    question16Text:setTextColor(244/255, 244/255, 244/255)
    question16Text.x = textPositionX
    question16Text.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    question16CorrectAnswer = display.newText("WHITE + RED", 0, 0, Arial, textSize)
    question16CorrectAnswer:setTextColor(1, 1, 1)
    question16CorrectAnswer.x = answerPosition4X
    question16CorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    question16Answer1 = display.newText("RED + BLUE", 0, 0, Arial, textSize)
    question16Answer1:setTextColor(1, 0, 0)
    question16Answer1.x = answerPosition1X
    question16Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question16Answer2 = display.newText("ORANGE + GREEN", 0, 0, Arial, textSize)
    question16Answer2:setTextColor(1, 128/255, 0)
    question16Answer2.x = answerPosition2X
    question16Answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    question16Answer3 = display.newText("YELLOW + PURPLE", 0, 0, Arial, textSize)
    question16Answer3:setTextColor(1, 1, 0)
    question16Answer3.x = answerPosition3X
    question16Answer3.y = answerPosition3Y

    -- insert the text objects into this scene
    sceneGroup:insert(question16CorrectAnswer)
    sceneGroup:insert(question16Answer1)
    sceneGroup:insert(question16Answer2)
    sceneGroup:insert(question16Answer3)

    correctAnswer = question16CorrectAnswer
    wrongAnswer1 = question16Answer1
    wrongAnswer2 = question16Answer2
    wrongAnswer3 = question16Answer3

    questionWasAsked = 16
end

-- seventeenth question
local function AskQuestion17(sceneGroup)
    -- set the question text
    question17Text = display.newText("How many primary colours are there?", 0, 0, Arial, textSize)
    question17Text:setTextColor(244/255, 244/255, 244/255)
    question17Text.x = textPositionX
    question17Text.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    question17CorrectAnswer = display.newText("3", 0, 0, Arial, textSize)
    question17CorrectAnswer:setTextColor(244/255, 244/255, 244/255)
    question17CorrectAnswer.x = answerPosition3X
    question17CorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    question17Answer1 = display.newText("1", 0, 0, Arial, textSize)
    question17Answer1:setTextColor(244/255, 244/255, 244/255)
    question17Answer1.x = answerPosition1X
    question17Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question17Answer2 = display.newText("2", 0, 0, Arial, textSize)
    question17Answer2:setTextColor(244/255, 244/255, 244/255)
    question17Answer2.x = answerPosition2X
    question17Answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    question17Answer3 = display.newText("5", 0, 0, Arial, textSize)
    question17Answer3:setTextColor(244/255, 244/255, 244/255)
    question17Answer3.x = answerPosition4X
    question17Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question17Text)
    sceneGroup:insert(question17CorrectAnswer)
    sceneGroup:insert(question17Answer1)
    sceneGroup:insert(question17Answer2)
    sceneGroup:insert(question17Answer3)

    correctAnswer = question17CorrectAnswer
    wrongAnswer1 = question17Answer1
    wrongAnswer2 = question17Answer2
    wrongAnswer3 = question17Answer3

    questionWasAsked = 17
end

-- eigtheenth question
local function AskQuestion18(sceneGroup)
    -- set the question text
    question18Text = display.newText("How many secondary colours are there?", 0, 0, Arial, textSize)
    question18Text:setTextColor(244/255, 244/255, 244/255)
    question18Text.x = textPositionX
    question18Text.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    question18CorrectAnswer = display.newText("3", 0, 0, Arial, textSize)
    question18CorrectAnswer:setTextColor(244/255, 244/255, 244/255)
    question18CorrectAnswer.x = answerPosition3X
    question18CorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    question18Answer1 = display.newText("1", 0, 0, Arial, textSize)
    question18Answer1:setTextColor(244/255, 244/255, 244/255)
    question18Answer1.x = answerPosition1X
    question18Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question18Answer2 = display.newText("2", 0, 0, Arial, textSize)
    question18Answer2:setTextColor(244/255, 244/255, 244/255)
    question18Answer2.x = answerPosition2X
    question18Answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    question18Answer3 = display.newText("5", 0, 0, Arial, textSize)
    question18Answer3:setTextColor(244/255, 244/255, 244/255)
    question18Answer3.x = answerPosition4X
    question18Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question18Text)
    sceneGroup:insert(question18CorrectAnswer)
    sceneGroup:insert(question18Answer1)
    sceneGroup:insert(question18Answer2)
    sceneGroup:insert(question18Answer3)

    correctAnswer = question18CorrectAnswer
    wrongAnswer1 = question18Answer1
    wrongAnswer2 = question18Answer2
    wrongAnswer3 = question18Answer3

    questionWasAsked = 18
end

-- nineteenth question
local function AskQuestion19(sceneGroup)
    -- set the question text
    question19Text = display.newText("How many tertiary (third level) colours are there?", 0, 0, Arial, textSize)
    question19Text:setTextColor(244/255, 244/255, 244/255)
    question19Text.x = textPositionX
    question19Text.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    question19CorrectAnswer = display.newText("6", 0, 0, Arial, textSize)
    question19CorrectAnswer:setTextColor(244/255, 244/255, 244/255)
    question19CorrectAnswer.x = answerPosition4X
    question19CorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    question19Answer1 = display.newText("3", 0, 0, Arial, textSize)
    question19Answer1:setTextColor(244/255, 244/255, 244/255)
    question19Answer1.x = answerPosition1X
    question19Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question19Answer2 = display.newText("4", 0, 0, Arial, textSize)
    question19Answer2:setTextColor(244/255, 244/255, 244/255)
    question19Answer2.x = answerPosition2X
    question19Answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    question19Answer3 = display.newText("5", 0, 0, Arial, textSize)
    question19Answer3:setTextColor(244/255, 244/255, 244/255)
    question19Answer3.x = answerPosition3X
    question19Answer3.y = answerPosition3Y

    -- insert the text objects into this scene
    sceneGroup:insert(question19Text)
    sceneGroup:insert(question19CorrectAnswer)
    sceneGroup:insert(question19Answer1)
    sceneGroup:insert(question19Answer2)
    sceneGroup:insert(question19Answer3)

    correctAnswer = question19CorrectAnswer
    wrongAnswer1 = question19Answer1
    wrongAnswer2 = question19Answer2
    wrongAnswer3 = question19Answer3

    questionWasAsked = 19
end

-- twentyth question
local function AskQuestion20(sceneGroup)
    -- set the question text
    question20Text = display.newText("Which color is a tertiary (third level) colour?", 0, 0, Arial, textSize)
    question20Text:setTextColor(244/255, 244/255, 244/255)
    question20Text.x = textPositionX
    question20Text.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    question20CorrectAnswer = display.newText("RED-ORANGE", 0, 0, Arial, textSize)
    question20CorrectAnswer:setTextColor(1, 0, 0)
    question20CorrectAnswer.x = answerPosition2X
    question20CorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    question20Answer1 = display.newText("YELLOW-BLUE", 0, 0, Arial, textSize)
    question20Answer1:setTextColor(0, 1, 0)
    question20Answer1.x = answerPosition1X
    question20Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question20Answer2 = display.newText("RED-GREEN", 0, 0, Arial, textSize)
    question20Answer2:setTextColor(127/255, 0, 1)
    question20Answer2.x = answerPosition3X
    question20Answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    question20Answer3 = display.newText("YELLOW-PURPLE", 0, 0, Arial, textSize)
    question20Answer3:setTextColor(1, 51/255, 1)
    question20Answer3.x = answerPosition4X
    question20Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question20Text)
    sceneGroup:insert(question20CorrectAnswer)
    sceneGroup:insert(question20Answer1)
    sceneGroup:insert(question20Answer2)
    sceneGroup:insert(question20Answer3)

    correctAnswer = question20CorrectAnswer
    wrongAnswer1 = question20Answer1
    wrongAnswer2 = question20Answer2
    wrongAnswer3 = question20Answer3

    questionWasAsked = 20
end

-- insert the text objects into this scene
sceneGroup:insert(questionText)
sceneGroup:insert(questionCorrectAnswer)
sceneGroup:insert(questionAnswer1)
sceneGroup:insert(questionAnswer2)
sceneGroup:insert(questionAnswer3)

-- ask a question
function AskQuestion(sceneGroup)
    -- choose out of the possoble 20 questions
    questionNumber = math.random(1, 20)
    print("AskQuestion(sceneGroup) :: questionnumber = " .. questionNumber)

    -- based on the questionNumber, call the function that will create that question. They are seperate because there was too
    --many lines of code in a single function if theye ere all together - there was an error because of it
    if (questionNumber == 1) then
        AskQuestion1(sceneGroup)

    elseif (questionNumber == 2) then
        AskQuestion2(sceneGroup)

    elseif (questionNumber == 3) then
        AskQuestion3(sceneGroup)

    elseif (questionNumber == 4) then
        AskQuestion4(sceneGroup)

    elseif (questionNumber == 5) then
        AskQuestion5(sceneGroup)

    elseif (questionNumber == 6) then
        AskQuestion6(sceneGroup)

    elseif (questionNumber == 7) then
        AskQuestion7(sceneGroup)

    elseif (questionNumber == 8) then
        AskQuestion8(sceneGroup)

    elseif (questionNumber == 9) then
        AskQuestion9(sceneGroup)

    elseif (questionNumber == 10) then
        AskQuestion10(sceneGroup)

    elseif (questionNumber == 11) then
        AskQuestion11(sceneGroup)

    elseif (questionNumber == 12) then
        AskQuestion12(sceneGroup)

    elseif (questionNumber == 13) then
        AskQuestion13(sceneGroup)

    elseif (questionNumber == 14) then
        AskQuestion14(sceneGroup)

    elseif (questionNumber == 15) then
        AskQuestion15(sceneGroup)

    elseif (questionNumber == 16) then
        AskQuestion16(sceneGroup)

    elseif (questionNumber == 17) then
        AskQuestion17(sceneGroup)

    elseif (questionNumber == 18) then
        AskQuestion18(sceneGroup)

    elseif (questionNumber == 19) then
        AskQuestion19(sceneGroup)

    elseif (questionNumber == 20) then
        AskQuestion20(sceneGroup)

    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )
    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

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
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 75)  

    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(questionText)

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
    print("level2_question :: scene:show( event ) :: START")
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        AskQuestion( sceneGroup )
        AddTextListeners()
    print("level2_question :: scene:show( event ) :: END")
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
print( "Adding Event Listeners...")
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
print( "Adding Event Listeners... done")

-----------------------------------------------------------------------------------------

return scene