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
local questionCorrectAnswer
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

-- insert the text variables from the questions (if a function so if there's an error, it's easier to find it)
local function InsertTextObjects()
    sceneGroup:insert(questionText)
    sceneGroup:insert(questionCorrectAnswer)
    sceneGroup:insert(answer1)
    sceneGroup:insert(answer2)
    sceneGroup:insert(answer3)
end

--adding the event listeners 
local function AddTextListeners()
    correctAnswer:addEventListener( "touch", TouchListenerAnswer )
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
    questionText.text = "Click on the primary colour"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    questionCorrectAnswer.text = "RED"
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition1X
    questionCorrectAnswer.y = answerPosition1Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "GREEN"
    answer1:setTextColor(0, 1, 0)
    answer1.x = answerPosition2X
    answer1.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "PURPLE"
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "PINK"
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- second question
local function AskQuestion2(sceneGroup)
    -- set the question text
    questionText.text = "Which mixture will create brown?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    --set the correct answer text, text color, and position (2nd)
    questionCorrectAnswer.text = display.newText("RED + GREEN", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "PINK + BLUE"
    answer1:setTextColor(1, 51/255, 1)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "ORANGE + PURPLE"
    answer2:setTextColor(1, 128/255, 0)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "YELLOW + GREEN"
    answer3:setTextColor(1, 1, 0)
    answer3.x = answerPosition2X
    answer3.y = answerPosition2Y


    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- third question
local function AskQuestion3(sceneGroup)
    -- set the question text
    questionText.text = "Which color is the opposite of orange?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer.text = "BLUE"
    questionCorrectAnswer:setTextColor(0, 0, 1)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "RED"
    answer1:setTextColor(1, 0, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "PURPLE"
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "GREEN"
    answer3:setTextColor(0, 1, 0)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3
end

-- fourth question
local function AskQuestion4(sceneGroup)
    -- set the question text
    questionText.text = "Which color is the opposite of purple?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    questionCorrectAnswer.text = "YELLOW"
    questionCorrectAnswer:setTextColor(1, 1, 0)
    questionCorrectAnswer.x = answerPosition1X
    questionCorrectAnswer.y = answerPosition1Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "RED"
    answer1:setTextColor(1, 0, 0)
    answer1.x = answerPosition2X
    answer1.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "BLUE"
    answer2:setTextColor(0, 0, 1)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "PINK",
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- fifth question
local function AskQuestion5(sceneGroup)
    -- set the question text
    questionText.text = "Which mixture will create green?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer.text = "YELLOW + BLUE"
    questionCorrectAnswer:setTextColor(1, 1, 0)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "RED + PURPLE"
    answer1:setTextColor(1, 0, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "BLUE + RED"
    answer2:setTextColor(0, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "RED + YELLOW"
    answer3:setTextColor(1, 0, 0)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- sixth question
local function AskQuestion6(sceneGroup)
    -- set the question text
    questionText.text = "Which mixture will create purple?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer.text = "RED + BLUE"
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "RED + GREEN"
    answer1:setTextColor(1, 0, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "BLUE + YELLOW"
    answer2:setTextColor(0, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "YELLOW + GREEN"
    answer3:setTextColor(1, 1, 0)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- seventh question
local function AskQuestion7(sceneGroup)
    -- set the question text
    questionText.text = "Which mixture will create orange?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer.text = "YELLOW + RED"
    questionCorrectAnswer:setTextColor(1, 1, 0)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "BLUE + YELLOW"
    answer1:setTextColor(0, 0, 1)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the third wrong answer text, text color, and position
    answer2.text = "GREEN + BLUE"
    answer2:setTextColor(0, 1, 0)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position green
    answer3.text = "PURPLE + GREEN"
    answer3:setTextColor(127/255, 0, 1)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- eigth question
local function AskQuestion8(sceneGroup)
    -- set the question text
    questionText.text = "Which colour is a secondary colour?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer.text = "GREEN"
    questionCorrectAnswer:setTextColor(0, 1, 0)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "YELLOW"
    answer1:setTextColor(1, 1, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "BLUE"
    answer2:setTextColor(0, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "RED"
    answer3:setTextColor(1, 0, 0)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question8Text)
    sceneGroup:insert(question8CorrectAnswer)
    sceneGroup:insert(question8Answer1)
    sceneGroup:insert(question8Answer2)
    sceneGroup:insert(question8Answer3)

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- ninth question
local function AskQuestion9(sceneGroup)
    -- set the question text
    questionText.text = "Which colour is a secondary colour?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    questionCorrectAnswer.text = "PURPLE"
    questionCorrectAnswer:setTextColor(127/255, 0, 1)
    questionCorrectAnswer.x = answerPosition2X
    questionCorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "BLUE"
    answer1:setTextColor(0, 0, 1)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "YELLOW"
    answer2:setTextColor(1, 1, 0)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "RED"
    answer3:setTextColor(1, 0, 0)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- tenth question
local function AskQuestion10(sceneGroup)
    -- set the question text
    questionText.text = "Which colour is a secondary colour?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer.text = "ORANGE"
    questionCorrectAnswer:setTextColor(1, 128/255, 0)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "BLUE"
    answer1:setTextColor(0, 0, 1)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "RED"
    answer2:setTextColor(1, 0, 0)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, 2text color, and position
    answer3.text = "YELLOW"
    answer3:setTextColor(1, 1, 0)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- eleventh question
local function AskQuestion11(sceneGroup)
    -- set the question text
    questionText.text = "Click on the primary color"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer.text = "RED"
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "GREEN"
    answer1:setTextColor(0, 1, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "PURPLE"
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "PINK"
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- twelveth question
local function AskQuestion12(sceneGroup)
    -- set the question text
    questionText.text = "Which colour is a primary colour?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    questionCorrectAnswer.text = "RED"
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition1X
    questionCorrectAnswer.y = answerPosition1Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "GREEN"
    answer1:setTextColor(0, 1, 0)
    answer1.x = answerPosition2X
    answer1.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "PURPLE"
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "BLACK"
    answer3:setTextColor(0, 0, 0)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- thirteenth question
local function AskQuestion13(sceneGroup)
    -- set the question text
    questionText.text = "Which colour is the opposite colour of red?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer.text = "GREEN"
    questionCorrectAnswer:setTextColor(0, 1, 0)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "YELLOW"
    answer1:setTextColor(1, 1, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "PURPLE"
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "PINK"
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- fourteenth question
local function AskQuestion14(sceneGroup)
    -- set the question text
    questionText.text = "Which colour is the opposite colour of blue?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    questionCorrectAnswer.text = "ORANGE"
    questionCorrectAnswer:setTextColor(1, 128/255, 0)
    questionCorrectAnswer.x = answerPosition2X
    questionCorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "YELLOW"
    answer1:setTextColor(1, 1, 0)
    answer1.x = answerPosition4X
    answer1.y = answerPosition4Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "PURPLE"
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "PINK"
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition1X
    answer3.y = answerPosition1Y

    correctAnswer = questionaCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- fifteenth question
local function AskQuestion15(sceneGroup)
    -- set the question text
    questionText.text = "Which colour is the opposite colour of green?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    questionCorrectAnswer.text = "RED"
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition2X
    questionCorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "BLUE"
    answer1:setTextColor(0, 0, 1)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "ORANGE"
    answer2:setTextColor(1, 128/255, 0)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "PINK"
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
end

-- sixteenth question
local function AskQuestion16(sceneGroup)
    -- set the question text
    questionText.text = "Which mixture will create pink?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer.text = "WHITE + RED"
    questionCorrectAnswer:setTextColor(1, 1, 1)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "RED + BLUE"
    answer1:setTextColor(1, 0, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "ORANGE + GREEN"
    answer2:setTextColor(1, 128/255, 0)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "YELLOW + PURPLE"
    answer3:setTextColor(1, 1, 0)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y


    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()

end

-- seventeenth question
local function AskQuestion17(sceneGroup)
    -- set the question text
    questionText.text = "How many primary colours are there?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer.text = "3"
    questionCorrectAnswer:setTextColor(244/255, 244/255, 244/255)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "1"
    answer1:setTextColor(244/255, 244/255, 244/255)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "2"
    answer2:setTextColor(244/255, 244/255, 244/255)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "5"
    answer3:setTextColor(244/255, 244/255, 244/255)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y


    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()

end

-- eigtheenth question
local function AskQuestion18(sceneGroup)
    -- set the question text
    questionText.text = "How many secondary colours are there?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer.text = "3"
    questionCorrectAnswer:setTextColor(244/255, 244/255, 244/255)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "1"
    answer1:setTextColor(244/255, 244/255, 244/255)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "2"
    answer2:setTextColor(244/255, 244/255, 244/255)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "5"
    answer3:setTextColor(244/255, 244/255, 244/255)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y


    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()

end

-- nineteenth question
local function AskQuestion19(sceneGroup)
    -- set the question text
    questionText.text = "How many tertiary (third level) colours are there?"
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer.text = "6"
    questionCorrectAnswer:setTextColor(244/255, 244/255, 244/255)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1.text = "3"
    answer1:setTextColor(244/255, 244/255, 244/255)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2.text = "4"
    answer2:setTextColor(244/255, 244/255, 244/255)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3.text = "5"
    answer3:setTextColor(244/255, 244/255, 244/255)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y


    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()

end


-- twentyth question
local function AskQuestion20(sceneGroup)
    -- set the question text
    questionText = display.newText("Which color is a tertiary (third level) colour?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    questionCorrectAnswer = display.newText("RED-ORANGE", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition2X
    questionCorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("YELLOW-BLUE", 0, 0, Arial, textSize)
    answer1:setTextColor(0, 1, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("RED-GREEN", 0, 0, Arial, textSize)
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("YELLOW-PURPLE", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y


    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    InsertTextObjects()
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
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        AskQuestion( sceneGroup )
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