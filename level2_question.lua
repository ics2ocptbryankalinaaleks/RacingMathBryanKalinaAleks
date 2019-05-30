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
local question1Text
local question1CorrectAnswer
local question1Answer1
local question1Answer2
local question1Answer3 

local question2Text
local question2CorrectAnswer
local question2Answer1
local question2Answer2
local question2Answer3

local question3Text
local question3CorrectAnswer
local question3Answer1
local question3Answer2
local question3Answer3 

local question4Text
local question4CorrectAnswer
local question4Answer1
local question4Answer2
local question4Answer3 

local question5Text
local question5CorrectAnswer
local question5Answer1
local question5Answer2
local question5Answer3

local question6Text
local question6CorrectAnswer
local question6Answer1
local question6Answer2
local question6Answer3

local question7Text
local question7CorrectAnswer
local question7Answer1
local question7Answer2
local question7Answer3

local question8Text
local question8CorrectAnswer
local question8Answer1
local question8Answer2
local question8Answer3 

local question9Text
local question9CorrectAnswer
local question9Answer1
local question9Answer2
local question9Answer3 

local question10Text
local question10CorrectAnswer
local question10Answer1
local question10Answer2
local question10Answer3 

local question11Text
local question11CorrectAnswer
local question11Answer1
local question11Answer2
local question11Answer3 

local question12Text
local question12CorrectAnswer
local question12Answer1
local question12Answer2
local question12Answer3 

local question13Text
local question13CorrectAnswer
local question13Answer1
local question13Answer2
local question13Answer3 

local question14Text
local question14CorrectAnswer
local question14Answer1
local question14Answer2
local question14Answer3 

local question15Text
local question15CorrectAnswer
local question15Answer1
local question15Answer2
local question15Answer3 

local question16Text
local question16CorrectAnswer
local question16Answer1
local question16Answer2
local question16Answer3

local question16Text
local question16CorrectAnswer
local question16Answer1
local question16Answer2
local question16Answer3 

local question17Text
local question17CorrectAnswer
local question17Answer1
local question17Answer2
local question17Answer3 

local question18Text
local question18CorrectAnswer
local question18Answer1
local question18Answer2
local question18Answer3 

local question19Text
local question19CorrectAnswer
local question19Answer1
local question19Answer2
local question19Answer3

local question20Text
local question20CorrectAnswer
local question20Answer1
local question20Answer2
local question20Answer3 

-- 
local bkg
local cover

local textSize = 50

local userAnswer
local textTouched = false

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

-- set the scroll speed of the cars
local function StartCars()

    scrollSpeedLogo = scrollSpeedLogoNew
    scrollSpeedCar1 = 1.4
    scrollSpeedCar2 = 1.2
    scrollSpeedCar3 = 1

end

-- hide objects for question 1
local function HideTextObjectsQuestion1()
    question1Text.isVisible = false
    question1CorrectAnswer.isVisible = false
    question1Answer1.isVisible = false
    question1Answer2.isVisible = false
    question1Answer3.isVisible = false
end

-- hide objects for question 2
local function HideTextObjectsQuestion2()
    question2Text.isVisible = false
    question2CorrectAnswer.isVisible = false
    question2Answer1.isVisible = false
    question2Answer2.isVisible = false
    question2Answer3.isVisible = false
end

-- hide objects for question 3
local function HideTextObjectsQuestion3()
    question3Text.isVisible = false
    question3CorrectAnswer.isVisible = false
    question3Answer1.isVisible = false
    question3Answer2.isVisible = false
    question3Answer3.isVisible = false
end

-- hide objects for question 4
local function HideTextObjectsQuestion4()
    question4Text.isVisible = false
    question4CorrectAnswer.isVisible = false
    question4Answer1.isVisible = false
    question4Answer2.isVisible = false
    question4Answer3.isVisible = false
end

-- hide objects for question 5
local function HideTextObjectsQuestion5()
    question5Text.isVisible = false
    question5CorrectAnswer.isVisible = false
    question5Answer1.isVisible = false
    question5Answer2.isVisible = false
    question5Answer3.isVisible = false
end

-- hide objects for question 6
local function HideTextObjectsQuestion6()
    question6Text.isVisible = false
    question6CorrectAnswer.isVisible = false
    question6Answer1.isVisible = false
    question6Answer2.isVisible = false
    question6Answer3.isVisible = false
end

-- hide objects for question 7
local function HideTextObjectsQuestion7()
    question7Text.isVisible = false
    question7CorrectAnswer.isVisible = false
    question7Answer1.isVisible = false
    question7Answer2.isVisible = false
    question7Answer3.isVisible = false
end

-- hide objects for question 8
local function HideTextObjectsQuestion8()
    question8Text.isVisible = false
    question8CorrectAnswer.isVisible = false
    question8Answer1.isVisible = false
    question8Answer2.isVisible = false
    question8Answer3.isVisible = false
end

-- hide objects for question 9
local function HideTextObjectsQuestion9()
    question9Text.isVisible = false
    question9CorrectAnswer.isVisible = false
    question9Answer1.isVisible = false
    question9Answer2.isVisible = false
    question9Answer3.isVisible = false
end

-- hide objects for question 10
local function HideTextObjectsQuestion10()
    question10Text.isVisible = false
    question10CorrectAnswer.isVisible = false
    question10Answer1.isVisible = false
    question10Answer2.isVisible = false
    question10Answer3.isVisible = false
end

-- hide objects for question 11
local function HideTextObjectsQuestion11()
    question11Text.isVisible = false
    question11CorrectAnswer.isVisible = false
    question11Answer1.isVisible = false
    question11Answer2.isVisible = false
    question11Answer3.isVisible = false
end

-- hide objects for question 12
local function HideTextObjectsQuestion12()
    question12Text.isVisible = false
    question12CorrectAnswer.isVisible = false
    question12Answer1.isVisible = false
    question12Answer2.isVisible = false
    question12Answer3.isVisible = false
end

-- hide objects for question 13
local function HideTextObjectsQuestion13()
    question13Text.isVisible = false
    question13CorrectAnswer.isVisible = false
    question13Answer1.isVisible = false
    question13Answer2.isVisible = false
    question13Answer3.isVisible = false
end

-- hide objects for question 14
local function HideTextObjectsQuestion14()
    question14Text.isVisible = false
    question14CorrectAnswer.isVisible = false
    question14Answer1.isVisible = false
    question14Answer2.isVisible = false
    question14Answer3.isVisible = false
end

-- hide objects for question 15
local function HideTextObjectsQuestion15()
    question15Text.isVisible = false
    question15CorrectAnswer.isVisible = false
    question15Answer1.isVisible = false
    question15Answer2.isVisible = false
    question15Answer3.isVisible = false
end

-- hide objects for question 16
local function HideTextObjectsQuestion16()
    question16Text.isVisible = false
    question16CorrectAnswer.isVisible = false
    question16Answer1.isVisible = false
    question16Answer2.isVisible = false
    question16Answer3.isVisible = false
end

-- hide objects for question 17
local function HideTextObjectsQuestion17()
    question17Text.isVisible = false
    question17CorrectAnswer.isVisible = false
    question17Answer1.isVisible = false
    question17Answer2.isVisible = false
    question17Answer3.isVisible = false
end

-- hide objects for question 18
local function HideTextObjectsQuestion18()
    question18Text.isVisible = false
    question18CorrectAnswer.isVisible = false
    question18Answer1.isVisible = false
    question18Answer2.isVisible = false
    question18Answer3.isVisible = false
end

-- hide objects for question 19
local function HideTextObjectsQuestion19()
    question19Text.isVisible = false
    question19CorrectAnswer.isVisible = false
    question19Answer1.isVisible = false
    question19Answer2.isVisible = false
    question19Answer3.isVisible = false
end

-- hide objects for question 20
local function HideTextObjectsQuestion20()
    question20Text.isVisible = false
    question20CorrectAnswer.isVisible = false
    question20Answer1.isVisible = false
    question20Answer2.isVisible = false
    question20Answer3.isVisible = false
end


--making transition to next scene
local function BackToLevel2() 

    StartCars()

    -- hide all of the text objects, depending on which question was called
    if (question1WasAsked == true) then
        HideTextObjectsQuestion1()

    elseif (question2WasAsked == true) then
        HideTextObjectsQuestion2()
    
    elseif (question3WasAsked == true) then
        HideTextObjectsQuestion3()

    elseif (question4WasAsked == true) then
        HideTextObjectsQuestion4()

    elseif (question5WasAsked == true) then
        HideTextObjectsQuestion5()

    elseif (question6WasAsked == true) then
        HideTextObjectsQuestion6()

    elseif (question7WasAsked == true) then
        HideTextObjectsQuestion7()

    elseif (question8WasAsked == true) then
        HideTextObjectsQuestion8()

    elseif (question9WasAsked == true) then
        HideTextObjectsQuestion9()

    elseif (question10WasAsked == true) then
        HideTextObjectsQuestion10()

    elseif (question11WasAsked == true) then
        HideTextObjectsQuestion11()

    elseif (question12WasAsked == true) then
        HideTextObjectsQuestion12()
 
    elseif (question13WasAsked == true) then
        HideTextObjectsQuestion13()

    elseif (question14WasAsked == true) then
        HideTextObjectsQuestion14()

    elseif (question15WasAsked == true) then
        HideTextObjectsQuestion15()

    elseif (question16WasAsked == true) then
        HideTextObjectsQuestion16()
 
    elseif (question17WasAsked == true) then
        HideTextObjectsQuestion17()

    elseif (question18WasAsked == true) then
        HideTextObjectsQuestion18()

    elseif (question19WasAsked == true) then
        HideTextObjectsQuestion19()

    elseif (question20WasAsked == true) then
        HideTextObjectsQuestion20()

    end


    composer.hideOverlay("crossFade", 400 )
  
    composer.gotoScene( "level2_screen" )
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1, added to the scroll speed
local function TouchListenerAnswer(touch)
    userAnswer = correctAnswer.text
    
    if (touch.phase == "ended") then
        questionsAnsweredLevel2 = questionsAnsweredLevel2 + 1

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
        
        BackToLevel2()  
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongAnswer2.text
    
    if (touch.phase == "ended") then

        BackToLevel2()
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongAnswer3.text
    
    if (touch.phase == "ended") then

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
    question1Text = display.newText("Click on the primary colour", 0, 0, Arial, textSize)
    question1Text:setTextColor(244/255, 244/255, 244/255)
    question1Text.x = textPositionX
    question1Text.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    question1CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question1CorrectAnswer:setTextColor(1, 0, 0)
    question1CorrectAnswer.x = answerPosition1X
    question1CorrectAnswer.y = answerPosition1Y

    -- set the first wrong answer text, text color, and position
    question1Answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
    question1Answer1:setTextColor(0, 1, 0)
    question1Answer1.x = answerPosition2X
    question1Answer1.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position
    question1Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question1Answer2:setTextColor(127/255, 0, 1)
    question1Answer2.x = answerPosition3X
    question1Answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    question1Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question1Answer3:setTextColor(1, 51/255, 1)
    question1Answer3.x = answerPosition4X
    question1Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question1Text)
    sceneGroup:insert(question1CorrectAnswer)
    sceneGroup:insert(question1Answer1)
    sceneGroup:insert(question1Answer2)
    sceneGroup:insert(question1Answer3)

    correctAnswer = question1CorrectAnswer
    wrongAnswer1 = question1Answer1
    wrongAnswer2 = question1Answer2
    wrongAnswer3 = question1Answer3

    question1WasAsked = true
end

-- second question
local function AskQuestion2(sceneGroup)
    -- set the question text
    question2Text = display.newText("Which mixture will make brown?", 0, 0, Arial, textSize)
    question2Text:setTextColor(244/255, 244/255, 244/255)
    question2Text.x = textPositionX
    question2Text.y = textPositionY

    --set the correct answer text, text color, and position (2nd)
    question2CorrectAnswer = display.newText("RED + GREEN", 0, 0, Arial, textSize)
    question2CorrectAnswer:setTextColor(1, 0, 0)
    question2CorrectAnswer.x = answerPosition4X
    question2CorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    question2Answer1 = display.newText("PINK + BLUE", 0, 0, Arial, textSize)
    question2Answer1:setTextColor(1, 51/255, 1)
    question2Answer1.x = answerPosition1X
    question2Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question2Answer2 = display.newText("ORANGE + PURPLE", 0, 0, Arial, textSize)
    question2Answer2:setTextColor(1, 128/255, 0)
    question2Answer2.x = answerPosition3X
    question2Answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    question2Answer3 = display.newText("YELLOW + GREEN", 0, 0, Arial, textSize) 
    question2Answer3:setTextColor(1, 1, 0)
    question2Answer3.x = answerPosition2X
    question2Answer3.y = answerPosition2Y

    -- insert the text objects into this scene
    sceneGroup:insert(question2Text)
    sceneGroup:insert(question2CorrectAnswer)
    sceneGroup:insert(question2Answer1)
    sceneGroup:insert(question2Answer2)
    sceneGroup:insert(question2Answer3)

    correctAnswer = question2CorrectAnswer
    wrongAnswer1 = question2Answer1
    wrongAnswer2 = question2Answer2
    wrongAnswer3 = question2Answer3

    question2WasAsked = true
end

-- third question
local function AskQuestion3(sceneGroup)
    -- set the question text
    question3Text = display.newText("Which color is the opposite of orange?", 0, 0, Arial, textSize)
    question3Text:setTextColor(244/255, 244/255, 244/255)
    question3Text.x = textPositionX
    question3Text.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    question3CorrectAnswer = display.newText("BLUE", 0, 0, Arial, textSize)
    question3CorrectAnswer:setTextColor(0, 0, 1)
    question3CorrectAnswer.x = answerPosition4X
    question3CorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    question3Answer1 = display.newText("RED", 0, 0, Arial, textSize)
    question3Answer1:setTextColor(1, 0, 0)
    question3Answer1.x = answerPosition1X
    question3Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question3Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question3Answer2:setTextColor(127/255, 0, 1)
    question3Answer2.x = answerPosition2X
    question3Answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    question3Answer3 = display.newText("GREEN", 0, 0, Arial, textSize)
    question3Answer3:setTextColor(0, 1, 0)
    question3Answer3.x = answerPosition3X
    question3Answer3.y = answerPosition3Y

    -- insert the text objects into this scene
    sceneGroup:insert(question3Text)
    sceneGroup:insert(question3CorrectAnswer)
    sceneGroup:insert(question3Answer1)
    sceneGroup:insert(question3Answer2)
    sceneGroup:insert(question3Answer3)

    correctAnswer = question3CorrectAnswer
    wrongAnswer1 = question3Answer1
    wrongAnswer2 = question3Answer2
    wrongAnswer3 = question3Answer3

    question3WasAsked = true
end

-- fourth question
local function AskQuestion4(sceneGroup)
    -- set the question text
    question4Text = display.newText("Which color is the opposite of purple?", 0, 0, Arial, textSize)
    question4Text:setTextColor(244/255, 244/255, 244/255)
    question4Text.x = textPositionX
    question4Text.y = textPositionY

    -- set the correct answer text, text color, and position (1st)
    question4CorrectAnswer = display.newText("YELLOW", 0, 0, Arial, textSize)
    question4CorrectAnswer:setTextColor(1, 1, 0)
    question4CorrectAnswer.x = answerPosition1X
    question4CorrectAnswer.y = answerPosition1Y

    -- set the first wrong answer text, text color, and position
    question4Answer1 = display.newText("RED", 0, 0, Arial, textSize)
    question4Answer1:setTextColor(1, 0, 0)
    question4Answer1.x = answerPosition2X
    question4Answer1.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position
    question4Answer2 = display.newText("BLUE", 0, 0, Arial, textSize)
    question4Answer2:setTextColor(0, 1, 0)
    question4Answer2.x = answerPosition3X
    question4Answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    question4Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question4Answer3:setTextColor(1, 51/255, 1)
    question4Answer3.x = answerPosition4X
    question4Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question4Text)
    sceneGroup:insert(question4CorrectAnswer)
    sceneGroup:insert(question4Answer1)
    sceneGroup:insert(question4Answer2)
    sceneGroup:insert(question4Answer3)

    correctAnswer = question4CorrectAnswer
    wrongAnswer1 = question4Answer1
    wrongAnswer2 = question4Answer2
    wrongAnswer3 = question4Answer3

    question4WasAsked = true
end

-- fifth question
local function AskQuestion5(sceneGroup)
    -- set the question text
    question5Text = display.newText("Which mixture will create green?", 0, 0, Arial, textSize)
    question5Text:setTextColor(244/255, 244/255, 244/255)
    question5Text.x = textPositionX
    question5Text.y = textPositionY

    -- set the correct answer text, text color, and position (3rd)
    question5CorrectAnswer = display.newText("YELLOW + BLUE", 0, 0, Arial, textSize)
    question5CorrectAnswer:setTextColor(1, 1, 0)
    question5CorrectAnswer.x = answerPosition3X
    question5CorrectAnswer.y = answerPosition3Y

    -- set the first wrong answer text, text color, and position
    question5Answer1 = display.newText("RED + PURPLE", 0, 0, Arial, textSize)
    question5Answer1:setTextColor(1, 0, 0)
    question5Answer1.x = answerPosition1X
    question5Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question5Answer2 = display.newText("BLUE + RED", 0, 0, Arial, textSize)
    question5Answer2:setTextColor(0, 1, 0)
    question5Answer2.x = answerPosition2X
    question5Answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    question5Answer3 = display.newText("RED + YELLOW", 0, 0, Arial, textSize)
    question5Answer3:setTextColor(1, 0, 0)
    question5Answer3.x = answerPosition4X
    question5Answer3.y = answerPosition4Y

    -- insert the text objects into this scene
    sceneGroup:insert(question5CorrectAnswer)
    sceneGroup:insert(question5Answer1)
    sceneGroup:insert(question5Answer2)
    sceneGroup:insert(question5Answer3)

    correctAnswer = question5CorrectAnswer
    wrongAnswer1 = question5Answer1
    wrongAnswer2 = question5Answer2
    wrongAnswer3 = question5Answer3

    question5WasAsked = true
end

-- sixth question
local function AskQuestion6(sceneGroup)
    print("AskQuestion6(sceneGroup)")
    -- set the question text
    question6Text = display.newText("Which mixture will create purple?", 0, 0, Arial, textSize)
    question6Text:setTextColor(244/255, 244/255, 244/255)
    question6Text.x = textPositionX
    question6Text.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    question6CorrectAnswer = display.newText("RED + BLUE", 0, 0, Arial, textSize)
    question6CorrectAnswer:setTextColor(1, 0, 0)
    question6CorrectAnswer.x = answerPosition4X
    question6CorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    question6Answer1 = display.newText("RED + GREEN", 0, 0, Arial, textSize)
    question6Answer1:setTextColor(1, 0, 0)
    question6Answer1.x = answerPosition1X
    question6Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question6Answer2 = display.newText("BLUE + YELLOW", 0, 0, Arial, textSize)
    question6Answer2:setTextColor(0, 1, 0)
    question6Answer2.x = answerPosition2X
    question6Answer2.y = answerPosition2Y

    -- set the third wrong answer text, text color, and position
    question6Answer3 = display.newText("YELLOW + GREEN", 0, 0, Arial, textSize)
    question6Answer3:setTextColor(1, 1, 0)
    question6Answer3.x = answerPosition3X
    question6Answer3.y = answerPosition3Y

    -- insert the text objects into this scene
    sceneGroup:insert(question6Text)
    sceneGroup:insert(question6CorrectAnswer)
    sceneGroup:insert(question6Answer1)
    sceneGroup:insert(question6Answer2)
    sceneGroup:insert(question6Answer3)

    correctAnswer = question6CorrectAnswer
    wrongAnswer1 = question6Answer1
    wrongAnswer2 = question6Answer2
    wrongAnswer3 = question6Answer3

    question6WasAsked = true
end

-- seventh question
local function AskQuestion7(sceneGroup)
    -- set the question text
    question7Text = display.newText("Which mixture will create orange?", 0, 0, Arial, textSize)
    question7Text:setTextColor(244/255, 244/255, 244/255)
    question7Text.x = textPositionX
    question7Text.y = textPositionY

    -- set the correct answer text, text color, and position (4th)
    question7CorrectAnswer = display.newText("YELLOW + RED", 0, 0, Arial, textSize)
    question7CorrectAnswer:setTextColor(1, 1, 0)
    question7CorrectAnswer.x = answerPosition4X
    question7CorrectAnswer.y = answerPosition4Y

    -- set the first wrong answer text, text color, and position
    question7Answer1 = display.newText("BLUE + YELLOW", 0, 0, Arial, textSize)
    question7Answer1:setTextColor(0, 0, 1)
    question7Answer1.x = answerPosition1X
    question7Answer1.y = answerPosition1Y

    -- set the third wrong answer text, text color, and position
    question7Answer2 = display.newText("GREEN + BLUE", 0, 0, Arial, textSize)
    question7Answer2:setTextColor(0, 1, 0)
    question7Answer2.x = answerPosition2X
    question7Answer2.y = answerPosition2Y

    -- set the second wrong answer text, text color, and position green
    question7Answer3 = display.newText("PURPLE + GREEN", 0, 0, Arial, textSize)
    question7Answer3:setTextColor(127/255, 0, 1)
    question7Answer3.x = answerPosition3X
    question7Answer3.y = answerPosition3Y

    -- insert the text objects into this scene
    sceneGroup:insert(question7Text)
    sceneGroup:insert(question7CorrectAnswer)
    sceneGroup:insert(question7Answer1)
    sceneGroup:insert(question7Answer2)
    sceneGroup:insert(question7Answer3)

    correctAnswer = question7CorrectAnswer
    wrongAnswer1 = question7Answer1
    wrongAnswer2 = question7Answer2
    wrongAnswer3 = question7Answer3

    question7WasAsked = true
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
    question8Answer2:setTextColor(0, 1, 0)
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
    sceneGroup:insert(question18Answer3)

    correctAnswer = question8CorrectAnswer
    wrongAnswer1 = question8Answer1
    wrongAnswer2 = question8Answer2
    wrongAnswer3 = question8Answer3

    question8WasAsked = true
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
    question9Answer1:setTextColor(0, 1, 0)
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

    question9WasAsked = true
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
    question10Answer1:setTextColor(0, 1, 0)
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

    question10WasAsked = true
end

-- eleventh question
local function AskQuestion11(sceneGroup)
    -- set the question text
    question11Text = display.newText("Click on the Primary Color", 0, 0, Arial, textSize)
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

    question11WasAsked = true
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

    question12WasAsked = true
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

    question13WasAsked = true
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
    question14Answer1.x = answerPosition1X
    question14Answer1.y = answerPosition1Y

    -- set the second wrong answer text, text color, and position
    question14Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question14Answer2:setTextColor(127/255, 0, 1)
    question14Answer2.x = answerPosition3X
    question14Answer2.y = answerPosition3Y

    -- set the third wrong answer text, text color, and position
    question14Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question14Answer3:setTextColor(1, 51/255, 1)
    question14Answer3.x = answerPosition4X
    question14Answer3.y = answerPosition4Y

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

    question14WasAsked = true
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
    question15Answer1:setTextColor(0, 1, 0)
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

    question15WasAsked = true
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

    question16WasAsked = true
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
    question17CorrectAnswer.y = answerPosition3X

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

    question17WasAsked = true
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

    question18WasAsked = true
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

    question19WasAsked = true
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

    -- set the first wrong answer text, text color, and position
    question20Answer1 = display.newText("YELLOW-BLUE", 0, 0, Arial, textSize)
    question20Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question20Answer2 = display.newText("RED-GREEN", 0, 0, Arial, textSize)
    question20Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question20Answer3 = display.newText("YELLOW-PURPLE", 0, 0, Arial, textSize)
    question20Answer3:setTextColor(1, 51/255, 1)

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

    question20WasAsked = true
end

-- ask a question
function AskQuestion(sceneGroup)
    print("AskQuestion(sceneGroup)")
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