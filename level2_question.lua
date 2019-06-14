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
local questionText = display.newText("", 0, 0, Arial, textSize)
local questionCorrectAnswer = display.newText("", 0, 0, Arial, textSize)
local answer1 = display.newText("", 0, 0, Arial, textSize)
local answer2 = display.newText("", 0, 0, Arial, textSize)
local answer3 = display.newText("", 0, 0, Arial, textSize)

local questionNumber

-- question position variable
local answerPositionLevel2
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

-- if the question had been asked, it;s variable will be set to true in order for the question 
--to not be repeated
local question1WasAsked = false
local question2WasAsked = false
local question3WasAsked = false
local question4WasAsked = false
local question5WasAsked = false
local question6WasAsked = false
local question7WasAsked = false
local question8WasAsked = false
local question9WasAsked = false
local question10WasAsked = false
local question11WasAsked = false
local question12WasAsked = false
local question13WasAsked = false
local question14WasAsked = false
local question15WasAsked = false
local question16WasAsked = false
local question17WasAsked = false
local question18WasAsked = false
local question19WasAsked = false
local question20WasAsked = false
-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function HideCorrect()
    correct.isVisible = false
end

local function HideIncorrect()
    incorrect.isVisible = false
end

local function ResetAll()
    question1WasAsked = false
    question2WasAsked = false
    question3WasAsked = false
    question4WasAsked = false
    question5WasAsked = false
    question6WasAsked = false
    question7WasAsked = false
    question8WasAsked = false
    question9WasAsked = false
    question10WasAsked = false
    question11WasAsked = false
    question12WasAsked = false
    question13WasAsked = false
    question14WasAsked = false
    question15WasAsked = false
    question16WasAsked = false
    question17WasAsked = false
    question18WasAsked = false
    question19WasAsked = false
    question20WasAsked = false
end

-- set the scroll speed of the cars
local function StartCars()

    scrollSpeedLogo = scrollSpeedLogoNew
    scrollSpeedCar1 = 1.4
    scrollSpeedCar2 = 1.2
    scrollSpeedCar3 = 1
end

-- hide objects for question 1
local function HideTextObjects()
    questionText.isVisible = false
    correctAnswer.isVisible = false
    answer1.isVisible = false
    answer2.isVisible = false
    answer3.isVisible = false
end

--making transition to next scene
local function BackToLevel2() 
    StartCars()

    -- hide all of the text objects
    print( "HideTextObjects 1")
    HideTextObjects()

    -- update the lives (function in level2_screen)
    UpdateLives()
print( "174")
    composer.hideOverlay("crossFade", 400 )
  
    composer.gotoScene( "level2_screen" )
end 

-----------------------------------------------------------------------------------------

-- position the answers
local function PositionAnswers()

    answerPositionLevel2 = math.random(1, 4)

    if (answerPositionLevel2 == 1) then
        questionCorrectAnswer.x = answerPosition1X
        questionCorrectAnswer.y = answerPosition1Y

        answer1.x = answerPosition2X
        answer1.y = answerPosition2Y

        answer2.x = answerPosition3X
        answer2.y = answerPosition3Y

        answer3.x = answerPosition4X
        answer3.y = answerPosition4Y

    elseif (answerPositionLevel2 == 2) then
        questionCorrectAnswer.x = answerPosition2X
        questionCorrectAnswer.y = answerPosition2Y

        answer1.x = answerPosition1X
        answer1.y = answerPosition1Y

        answer2.x = answerPosition3X
        answer2.y = answerPosition3Y

        answer3.x = answerPosition4X
        answer3.y = answerPosition4Y

    elseif (answerPositionLevel2 == 3) then
        questionCorrectAnswer.x = answerPosition3X
        questionCorrectAnswer.y = answerPosition3Y

        answer1.x = answerPosition1X
        answer1.y = answerPosition1Y

        answer2.x = answerPosition2X
        answer2.y = answerPosition2Y

        answer3.x = answerPosition4X
        answer3.y = answerPosition4Y

    elseif (answerPositionLevel2 == 4) then
        questionCorrectAnswer.x = answerPosition4X
        questionCorrectAnswer.y = answerPosition4Y

        answer1.x = answerPosition1X
        answer1.y = answerPosition1Y

        answer2.x = answerPosition2X
        answer2.y = answerPosition2Y

        answer3.x = answerPosition3X
        answer3.y = answerPosition3Y
    end
end

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

        -- subtract a life
        level2Lives = level2Lives - 1
        
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

        -- subtract a life
        level2Lives = level2Lives - 1

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

        -- subtract a life
        level2Lives = level2Lives - 1

        BackToLevel2()
        
    end 
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
    questionText = display.newText("Click on the primary colour", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    questionCorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition1X
    questionCorrectAnswer.y = answerPosition1Y

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

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question1WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- second question
local function AskQuestion2(sceneGroup)
    -- set the question text
    questionText = display.newText("Which mixture will create brown?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    --set the correct answer text, text color, and position (2nd)
    questionCorrectAnswer = display.newText("RED + GREEN", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

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

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question2WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- third question
local function AskQuestion3(sceneGroup)
    -- set the question text
    questionText = display.newText("Which color is the opposite of orange?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer = display.newText("BLUE", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(0, 0, 1)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

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

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question3WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- fourth question
local function AskQuestion4(sceneGroup)
    -- set the question text
    questionText = display.newText("Which color is the opposite of purple?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    questionCorrectAnswer = display.newText("YELLOW", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 1, 0)
    questionCorrectAnswer.x = answerPosition1X
    questionCorrectAnswer.y = answerPosition1Y

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

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question4WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- fifth question
local function AskQuestion5(sceneGroup)
    -- set the question text
    questionText = display.newText("Which mixture will create green?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer = display.newText("YELLOW + BLUE", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 1, 0)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

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

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question5WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- sixth question
local function AskQuestion6(sceneGroup)
    -- set the question text
    questionText = display.newText("Which mixture will create purple?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer = display.newText("RED + BLUE", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

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

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question6WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- seventh question
local function AskQuestion7(sceneGroup)
    -- set the question text
    questionText = display.newText("Which mixture will create orange?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer = display.newText("YELLOW + RED", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 1, 0)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

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

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question7WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- eigth question
local function AskQuestion8(sceneGroup)
    -- set the question text
    questionText = display.newText("Which colour is a secondary colour?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer = display.newText("GREEN", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(0, 1, 0)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("YELLOW", 0, 0, Arial, textSize)
    answer1:setTextColor(1, 1, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("BLUE", 0, 0, Arial, textSize)
    answer2:setTextColor(0, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("RED", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 0, 0)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question8WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- ninth question
local function AskQuestion9(sceneGroup)
    -- set the question text
    questionText = display.newText("Which colour is a secondary colour?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    questionCorrectAnswer = display.newText("PURPLE", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(127/255, 0, 1)
    questionCorrectAnswer.x = answerPosition2X
    questionCorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("BLUE", 0, 0, Arial, textSize)
    answer1:setTextColor(0, 0, 1)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("YELLOW", 0, 0, Arial, textSize)
    answer2:setTextColor(1, 1, 0)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("RED", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 0, 0)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question9WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- tenth question
local function AskQuestion10(sceneGroup)
    -- set the question text
    questionText = display.newText("Which colour is a secondary colour?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer = display.newText("ORANGE", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 128/255, 0)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("BLUE", 0, 0, Arial, textSize)
    answer1:setTextColor(0, 0, 1)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("RED", 0, 0, Arial, textSize)
    answer2:setTextColor(1, 0, 0)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, 2text color, and position
    answer3 = display.newText("YELLOW", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 1, 0)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question10WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- eleventh question
local function AskQuestion11(sceneGroup)
    -- set the question text
    questionText = display.newText("Click on the primary color", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
    answer1:setTextColor(0, 1, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question11WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- twelveth question
local function AskQuestion12(sceneGroup)
    -- set the question text
    questionText = display.newText("Which colour is a primary colour?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    questionCorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition1X
    questionCorrectAnswer.y = answerPosition1Y

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
    answer3 = display.newText("BLACK", 0, 0, Arial, textSize)
    answer3:setTextColor(0, 0, 0)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question12WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- thirteenth question
local function AskQuestion13(sceneGroup)
    -- set the question text
    questionText = display.newText("Which colour is the opposite\ncolour of red?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer = display.newText("GREEN", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(0, 1, 0)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("YELLOW", 0, 0, Arial, textSize)
    answer1:setTextColor(1, 1, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question13WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- fourteenth question
local function AskQuestion14(sceneGroup)
    -- set the question text
    questionText = display.newText("Which colour is the opposite\ncolour of blue?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    questionCorrectAnswer = display.newText("ORANGE", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 128/255, 0)
    questionCorrectAnswer.x = answerPosition2X
    questionCorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("YELLOW", 0, 0, Arial, textSize)
    answer1:setTextColor(1, 1, 0)
    answer1.x = answerPosition4X
    answer1.y = answerPosition4Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    answer2:setTextColor(127/255, 0, 1)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition1X
    answer3.y = answerPosition1Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question14WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- fifteenth question
local function AskQuestion15(sceneGroup)
    -- set the question text
    questionText = display.newText("Which colour is the opposite\ncolour of green?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (2nd)
    questionCorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 0, 0)
    questionCorrectAnswer.x = answerPosition2X
    questionCorrectAnswer.y = answerPosition2Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("BLUE", 0, 0, Arial, textSize)
    answer1:setTextColor(0, 0, 1)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("ORANGE", 0, 0, Arial, textSize)
    answer2:setTextColor(1, 128/255, 0)
    answer2.x = answerPosition3X
    answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 51/255, 1)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question15WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- sixteenth question
local function AskQuestion16(sceneGroup)
    -- set the question text
    questionText = display.newText("Which mixture will create pink?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer = display.newText("WHITE + RED", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(1, 1, 1)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("RED + BLUE", 0, 0, Arial, textSize)
    answer1:setTextColor(1, 0, 0)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("ORANGE + GREEN", 0, 0, Arial, textSize)
    answer2:setTextColor(1, 128/255, 0)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("YELLOW + PURPLE", 0, 0, Arial, textSize)
    answer3:setTextColor(1, 1, 0)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question16WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- seventeenth question
local function AskQuestion17(sceneGroup)
    -- set the question text
    questionText = display.newText("How many primary colours are there?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer = display.newText("3", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(244/255, 244/255, 244/255)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("1", 0, 0, Arial, textSize)
    answer1:setTextColor(244/255, 244/255, 244/255)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("2", 0, 0, Arial, textSize)
    answer2:setTextColor(244/255, 244/255, 244/255)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("5", 0, 0, Arial, textSize)
    answer3:setTextColor(244/255, 244/255, 244/255)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question17WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- eigtheenth question
local function AskQuestion18(sceneGroup)
    -- set the question text
    questionText = display.newText("How many secondary colours\nare there?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    questionCorrectAnswer = display.newText("3", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(244/255, 244/255, 244/255)
    questionCorrectAnswer.x = answerPosition3X
    questionCorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("1", 0, 0, Arial, textSize)
    answer1:setTextColor(244/255, 244/255, 244/255)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("2", 0, 0, Arial, textSize)
    answer2:setTextColor(244/255, 244/255, 244/255)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("5", 0, 0, Arial, textSize)
    answer3:setTextColor(244/255, 244/255, 244/255)
    answer3.x = answerPosition4X
    answer3.y = answerPosition4Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question18WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- nineteenth question
local function AskQuestion19(sceneGroup)
    -- set the question text
    questionText = display.newText("How many tertiary (third level)\ncolours are there?", 0, 0, Arial, textSize)
    questionText:setTextColor(244/255, 244/255, 244/255)
    questionText.x = textPositionX
    questionText.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    questionCorrectAnswer = display.newText("6", 0, 0, Arial, textSize)
    questionCorrectAnswer:setTextColor(244/255, 244/255, 244/255)
    questionCorrectAnswer.x = answerPosition4X
    questionCorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    answer1 = display.newText("3", 0, 0, Arial, textSize)
    answer1:setTextColor(244/255, 244/255, 244/255)
    answer1.x = answerPosition1X
    answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    answer2 = display.newText("4", 0, 0, Arial, textSize)
    answer2:setTextColor(244/255, 244/255, 244/255)
    answer2.x = answerPosition2X
    answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    answer3 = display.newText("5", 0, 0, Arial, textSize)
    answer3:setTextColor(244/255, 244/255, 244/255)
    answer3.x = answerPosition3X
    answer3.y = answerPosition3Y

    correctAnswer = questionCorrectAnswer
    wrongAnswer1 = answer1
    wrongAnswer2 = answer2
    wrongAnswer3 = answer3

    question19WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- twentyth question
local function AskQuestion20(sceneGroup)
    -- set the question text
    questionText = display.newText("Which color is a tertiary\n(third level) colour?", 0, 0, Arial, textSize)
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

    question20WasAsked = true

    PositionAnswers()
    AddTextListeners()
end

-- ask a question
function AskQuestion(sceneGroup)
    -- choose out of the possoble 20 questions
    questionNumber = math.random(13, 15)

    --[[    based on the questionNumber, call the function that will create that question. They are seperate because there was too
    many lines of code in a single function if they are all together - there was an error because of it    ]]--
    if (questionNumber == 1) then

        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question1WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion1(sceneGroup)
        end

    elseif (questionNumber == 2) then

        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question2WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion2(sceneGroup)
        end

    elseif (questionNumber == 3) then

        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question3WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion3(sceneGroup)
        end

    elseif (questionNumber == 4) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question4WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion4(sceneGroup)
        end

    elseif (questionNumber == 5) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question5WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion5(sceneGroup)
        end

    elseif (questionNumber == 6) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question6WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion6(sceneGroup)
        end

    elseif (questionNumber == 7) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question7WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion7(sceneGroup)
        end

    elseif (questionNumber == 8) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question8WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion8(sceneGroup)
        end

    elseif (questionNumber == 9) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question9WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion9(sceneGroup)
        end

    elseif (questionNumber == 10) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question10WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion10(sceneGroup)
        end

    elseif (questionNumber == 11) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question11WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion11(sceneGroup)
        end

    elseif (questionNumber == 12) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question12WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion12(sceneGroup)
        end

    elseif (questionNumber == 13) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question13WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion13(sceneGroup)
        end

    elseif (questionNumber == 14) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question14WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion14(sceneGroup)
        end

    elseif (questionNumber == 15) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question15WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion15(sceneGroup)
        end

    elseif (questionNumber == 16) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question16WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion16(sceneGroup)
        end

    elseif (questionNumber == 17) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question17WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion17(sceneGroup)
        end

    elseif (questionNumber == 18) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question18WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion18(sceneGroup)
        end

    elseif (questionNumber == 19) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question19WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion19(sceneGroup)
        end

    elseif (questionNumber == 20) then
        
        -- make sure this question hasn't been asked before. If it has, re-call the function, if not, ask the question
        if (question20WasAsked == true) then
            AskQuestion(sceneGroup)
        else
            AskQuestion20(sceneGroup)
        end

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
        ResetAll()
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