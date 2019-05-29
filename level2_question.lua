-----------------------------------------------------------------------------------------
-- level1_screen.lua
-- Created by: Allison
-- Date: May 16, 2017
-- Description: This is the level 1 screen of the game. the charater can be dragged to move
--If character goes off a certain araea they go back to the start. When a user interactes
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
local question2CorrectAnswerFirst
local question2CorrectAnswerPlus
local question2CorrectAnswerSecond
local question2Answer1First
local question2Answer1Plus
local question2Answer1Second
local question2Answer2First
local question2Answer2Plus
local question2Answer2Second
local question2Answer3First
local question2Answer3Plus
local question2Answer3Second

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
local question5CorrectAnswerFirst
local question5CorrectAnswerPlus
local question5CorrectAnswerSecond
local question5Answer1First
local question5Answer1Plus
local question5Answer1Second
local question5Answer2First
local question5Answer2Plus
local question5Answer2Second
local question5Answer3First
local question5Answer3Plus
local question5Answer3Second

local question6Text
local question6CorrectAnswerFirst
local question6CorrectAnswerPlus
local question6CorrectAnswerSecond
local question6Answer1First
local question6Answer1Plus
local question6Answer1Second
local question6Answer2First
local question6Answer2Plus
local question6Answer2Second
local question6Answer3First
local question6Answer3Plus
local question6Answer3Second

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
local question16CorrectAnswerFirst
local question16CorrectAnswerPlus
local question16CorrectAnswerSecond
local question16Answer1First
local question16Answer1Plus
local question16Answer1Second
local question16Answer2First
local question16Answer2Plus
local question16Answer2Second
local question16Answer3First
local question16Answer3Plus
local question16Answer3Second

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

local userAnswer
local textTouched = false

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
function BackToLevel1() 
    composer.hideOverlay("crossFade", 400 )
  
    composer.gotoScene( "level2_screen" )
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = answerText.text
    
    if (touch.phase == "ended") then

        BackToLevel2()
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    userAnswer = wrongText1.text
    
    if (touch.phase == "ended") then
        
        BackToLevel2()  
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongText2.text
    
    if (touch.phase == "ended") then

        BackToLevel2()
        
    end 
end

local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongText3.text
    
    if (touch.phase == "ended") then

        BackToLevel2()
        
    end 
end


--adding the event listeners 
--[[local function AddTextListeners ( )
    answerText:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)

end

--removing the event listeners
local function RemoveTextListeners()
    answerText:removeEventListener( "touch", TouchListenerAnswer )
    wrongText1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end]]--

-- first question 
local function AskQuestion1(sceneGroup)
    -- set the question text
    question1Text = display.newText("Click on the Primary Color", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position (1st)
    question1CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question1CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question1Answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
    question1Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question1Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question1Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question1Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question1Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question1Text)
    sceneGroup:insert(question1CorrectAnswer)
    sceneGroup:insert(question1Answer1)
    sceneGroup:insert(question1Answer2)
    sceneGroup:insert(question1Answer3)
end

local function AskQuestion2(sceneGroup)
    -- set the question text
    question2Text = display.newText("Which mixture will make brown?", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position (2nd)
    question2CorrectAnswerFirst = display.newText("RED", 0, 0, Arial, textSize)
    question2CorrectAnswerFirst:setTextColor(1, 0, 0)
    question2CorrectAnswerPlus = display.newText(" + ", 0, 0, Arial, textSize)
    question2CorrectAnswerPlus:setTextColor(0, 0, 0)
    question2CorrectAnswerSecond = display.newText("BROWN", 0, 0, Arial, textSize)
    question2CorrectAnswerSecond:setTextColor(102/255, 51/255, 0)

    -- set the first wrong answer text, text color, and position
    question2Answer1First = display.newText("PINK", 0, 0, Arial, textSize)
    question2Answer1First:setTextColor(1, 51/255, 1)
    question2Answer1Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question2Answer1Plus:setTextColor(0, 0, 0)
    question2Answer1Second = display.newText("BLUE", 0, 0, Arial, textSize)
    question2Answer1Second:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question2Answer2First = display.newText("ORANGE", 0, 0, Arial, textSize)
    question2Answer2First:setTextColor(1, 128/255, 0)
    question2Answer2Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question2Answer2Plus:setTextColor(0, 0, 0)
    question2Answer2Second = display.newText("PURPLE", 0, 0, Arial, textSize)
    question2Answer2Second:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question2Answer3First = display.newText("YELLOW", 0, 0, Arial, textSize) 
    question2Answer3First:setTextColor(1, 1, 0)
    question2Answer3Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question2Answer3Plus:setTextColor(0, 0, 0)
    question2Answer3Second = display.newText("GREEN", 0, 0, Arial, textSize)
    question2Answer3Second:setTextColor(0, 1, 0)

    sceneGroup:insert(question2CorrectAnswerFirst)
    sceneGroup:insert(question2CorrectAnswerPlus)
    sceneGroup:insert(question2CorrectAnswerSecond)
    sceneGroup:insert(question2Answer1First)
    sceneGroup:insert(question2Answer1Plus)
    sceneGroup:insert(question2Answer1Second)
    sceneGroup:insert(question2Answer2First)
    sceneGroup:insert(question2Answer2Plus)
    sceneGroup:insert(question2Answer2Second)
    sceneGroup:insert(question2Answer3First)
    sceneGroup:insert(question2Answer3Plus)
    sceneGroup:insert(question2Answer3Second)
end

local function AskQuestion3(sceneGroup)
    -- set the question text
    question3Text = display.newText("Which color is the opposite of orange?", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position (4th)
    question3CorrectAnswer = display.newText("BLUE", 0, 0, Arial, textSize)
    question3CorrectAnswer:setTextColor(0, 0, 1)

    -- set the first wrong answer text, text color, and position
    question3Answer1 = display.newText("RED", 0, 0, Arial, textSize)
    question3Answer1:setTextColor(1, 0, 0)

    -- set the second wrong answer text, text color, and position
    question3Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question3Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question3Answer3 = display.newText("GREEN", 0, 0, Arial, textSize)
    question3Answer3:setTextColor(0, 1, 0)

    sceneGroup:insert(question3Text)
    sceneGroup:insert(question3CorrectAnswer)
    sceneGroup:insert(question3Answer1)
    sceneGroup:insert(question3Answer2)
    sceneGroup:insert(question3Answer3)
end

local function AskQuestion4(sceneGroup)
    -- set the question text
    question4Text = display.newText("Which color is the opposite of purple?", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position (1st)
    question4CorrectAnswer = display.newText("BLACK", 0, 0, Arial, textSize)
    question4CorrectAnswer:setTextColor(0, 0, 0)

    -- set the first wrong answer text, text color, and position
    question4Answer1 = display.newText("RED", 0, 0, Arial, textSize)
    question4Answer1:setTextColor(1, 0, 0)

    -- set the second wrong answer text, text color, and position
    question4Answer2 = display.newText("BLUE", 0, 0, Arial, textSize)
    question4Answer2:setTextColor(0, 0, 1)

    -- set the third wrong answer text, text color, and position
    question4Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question4Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question4Text)
    sceneGroup:insert(question4CorrectAnswer)
    sceneGroup:insert(question4Answer1)
    sceneGroup:insert(question4Answer2)
    sceneGroup:insert(question4Answer3)
end

local function AskQuestion5(sceneGroup)
    -- set the question text
    question5Text = display.newText("Which mixture will create green?", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position (3rd)
    question5CorrectAnswerFirst = display.newText("YELLOW", 0, 0, Arial, textSize)
    question5CorrectAnswerFirst:setTextColor(1, 0, 0)
    question5CorrectAnswerPlus = display.newText(" + ", 0, 0, Arial, textSize)
    question5CorrectAnswerPlus:setTextColor(0, 0, 0)
    question5CorrectAnswerSecond = display.newText("BLUE", 0, 0, Arial, textSize)
    question5CorrectAnswerSecond:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question5Answer1First = display.newText("RED", 0, 0, Arial, textSize)
    question5Answer1First:setTextColor(0, 1, 0)
    question5Answer1Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question5Answer1Plus:setTextColor(0, 0, 0)
    question5Answer1Second = display.newText("PURPLE", 0, 0, Arial, textSize)
    question5Answer1Second:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question5Answer2First = display.newText("BLUE", 0, 0, Arial, textSize)
    question5Answer2First:setTextColor(127/255, 0, 1)
    question5Answer2Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question5Answer2Plus:setTextColor(0, 0, 0)
    question5Answer2Second = display.newText("RED", 0, 0, Arial, textSize)
    question5Answer2Second:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question5Answer3First = display.newText("RED", 0, 0, Arial, textSize)
    question5Answer3First:setTextColor(1, 51/255, 1)
    question5Answer3Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question5Answer3Plus:setTextColor(0, 0, 0)
    question5Answer3Second = display.newText("YELLOW", 0, 0, Arial, textSize)
    question5Answer3Second:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question5CorrectAnswerFirst)
    sceneGroup:insert(question5CorrectAnswerPlus)
    sceneGroup:insert(question5CorrectAnswerSecond)
    sceneGroup:insert(question5Answer1First)
    sceneGroup:insert(question5Answer1Plus)
    sceneGroup:insert(question5Answer1Second)
    sceneGroup:insert(question5Answer2First)
    sceneGroup:insert(question5Answer2Plus)
    sceneGroup:insert(question5Answer2Second)
    sceneGroup:insert(question5Answer3First)
    sceneGroup:insert(question5Answer3Plus)
    sceneGroup:insert(question5Answer3Second)
end

local function AskQuestion6(sceneGroup)
    -- set the question text
    question6Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question6CorrectAnswerFirst = display.newText("", 0, 0, Arial, textSize)
    question6CorrectAnswerFirst:setTextColor(1, 0, 0)
    question6CorrectAnswerPlus = display.newText(" = ", 0, 0, Arial, textSize)
    question6CorrectAnswerPlus:setTextColor(0, 0, 0)
    question6CorrectAnswerSecond = display.newText("", 0, 0, Arial, textSize)
    question6CorrectAnswerSecond:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question6Answer1First = display.newText("", 0, 0, Arial, textSize)
    question6Answer1First:setTextColor(0, 1, 0)
    question6Answer1Plus = display.newText(" = ", 0, 0, Arial, textSize)
    question6Answer1Plus:setTextColor(0, 0, 0)
    question6Answer1Second = display.newText("", 0, 0, Arial, textSize)
    question6Answer1Second:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question6Answer2First = display.newText("", 0, 0, Arial, textSize)
    question6Answer2First:setTextColor(127/255, 0, 1)
    question6Answer2Plus = display.newText(" = ", 0, 0, Arial, textSize)
    question6Answer2Plus:setTextColor(0, 0, 0)
    question6Answer2Second = display.newText("", 0, 0, Arial, textSize)
    question6Answer2Second:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question6Answer3First = display.newText("", 0, 0, Arial, textSize)
    question6Answer3First:setTextColor(1, 51/255, 1)
    question6Answer3Plus = display.newText(" = ", 0, 0, Arial, textSize)
    question6Answer3Plus:setTextColor(0, 0, 0)
    question6Answer3Second = display.newText("", 0, 0, Arial, textSize)
    question6Answer3Second:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question6Text)
    sceneGroup:insert(question6CorrectAnswerFirst)
    sceneGroup:insert(question6CorrectAnswerPlus)
    sceneGroup:insert(question6CorrectAnswer)
    sceneGroup:insert(question6Answer1First)
    sceneGroup:insert(question6Answer1Plus)
    sceneGroup:insert(question6Answer1Second)
    sceneGroup:insert(question6Answer2First)
    sceneGroup:insert(question6Answer2Plus)
    sceneGroup:insert(question6Answer2Second)
    sceneGroup:insert(question6Answer3First)
    sceneGroup:insert(question6Answer3Plus)
    sceneGroup:insert(question6Answer3Second)
end
 
local function AskQuestion7(sceneGroup)
    -- set the question text
    question7Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question7CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question7CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question7Answer1 = display.newText("", 0, 0, Arial, textSize)
    question7Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question7Answer2 = display.newText("", 0, 0, Arial, textSize)
    question7Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question7Answer3 = display.newText("", 0, 0, Arial, textSize)
    question7Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question7Text)
    sceneGroup:insert(question7CorrectAnswer)
    sceneGroup:insert(question71)
    sceneGroup:insert(question72)
    sceneGroup:insert(question73)
end

local function AskQuestion8(sceneGroup)
    -- set the question text
    question8Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question8CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question8CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question8Answer1 = display.newText("", 0, 0, Arial, textSize)
    question8Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question8Answer2 = display.newText("", 0, 0, Arial, textSize)
    question8Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question8Answer3 = display.newText("", 0, 0, Arial, textSize)
    question8Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question8Text)
    sceneGroup:insert(question8CorrectAnswer)
    sceneGroup:insert(question8Answer1)
    sceneGroup:insert(question8Answer2)
    sceneGroup:insert(question18Answer3)
end

local function AskQuestion9(sceneGroup)
    -- set the question text
    question9Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question9CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question9CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question9Answer1 = display.newText("", 0, 0, Arial, textSize)
    question9Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question9Answer2 = display.newText("", 0, 0, Arial, textSize)
    question9Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question9Answer3 = display.newText("", 0, 0, Arial, textSize)
    question9Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question9Text)
    sceneGroup:insert(question9CorrectAnswer)
    sceneGroup:insert(question9Answer1)
    sceneGroup:insert(question9Answer2)
    sceneGroup:insert(question9Answer3)
end

local function AskQuestion10(sceneGroup)
    -- set the question text
    question10Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question10CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question10CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question10Answer1 = display.newText("", 0, 0, Arial, textSize)
    question10Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question10Answer2 = display.newText("", 0, 0, Arial, textSize)
    question10Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, 2text color, and position
    question10Answer3 = display.newText("", 0, 0, Arial, textSize)
    question10Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question10Text)
    sceneGroup:insert(question10CorrectAnswer)
    sceneGroup:insert(question10Answer1)
    sceneGroup:insert(question10Answer2)
    sceneGroup:insert(question10Answer3)
end

local function AskQuestion11(sceneGroup)
    -- set the question text
    question11Text = display.newText("Click on the Primary Color", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question11CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question11CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question11Answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
    question11Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question11Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question11Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question11Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question11Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question11Text)
    sceneGroup:insert(question11CorrectAnswer)
    sceneGroup:insert(question11Answer1)
    sceneGroup:insert(question11Answer2)
    sceneGroup:insert(question11Answer3)
end

local function AskQuestion12(sceneGroup)
    -- set the question text
    question12Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question12CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question12CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question12Answer1 = display.newText("", 0, 0, Arial, textSize)
    question12Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question12Answer2 = display.newText("", 0, 0, Arial, textSize)
    question12Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question12Answer3 = display.newText("", 0, 0, Arial, textSize)
    question12Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion13(sceneGroup)
    -- set the question text
    question13Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question13CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question13CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question13Answer1 = display.newText("", 0, 0, Arial, textSize)
    question13Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question13Answer2 = display.newText("", 0, 0, Arial, textSize)
    question13Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question13Answer3 = display.newText("", 0, 0, Arial, textSize)
    question13Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion14(sceneGroup)
    -- set the question text
    question14Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question14CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question14CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question14Answer1 = display.newText("", 0, 0, Arial, textSize)
    question14Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question14Answer2 = display.newText("", 0, 0, Arial, textSize)
    question14Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question14Answer3 = display.newText("", 0, 0, Arial, textSize)
    question14Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion15(sceneGroup)
    -- set the question text
    question15Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question15CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question15CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question15Answer1 = display.newText("", 0, 0, Arial, textSize)
    question15Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question15Answer2 = display.newText("", 0, 0, Arial, textSize)
    question15Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question15Answer3 = display.newText("", 0, 0, Arial, textSize)
    question15Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion16(sceneGroup)
    -- set the question text
    question16Text = display.newText("Which mixture will create pink?", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question16CorrectAnswerFirst = display.newText("WHITE", 0, 0, Arial, textSize)
    question16CorrectAnswerFirst:setTextColor(1, 0, 0)
    question16CorrectAnswerPlus = display.newText(" + ", 0, 0, Arial, textSize)
    question16CorrectAnswerPlus:setTextColor(0, 0, 0)
    question16CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question16CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question16Answer1First = display.newText("RED", 0, 0, Arial, textSize)
    question16Answer1First:setTextColor(1, 0, 0)
    question16Answer1Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question16Answer1Plus:setTextColor(0, 0, 0)
    question16Answer1Second = display.newText("BLUE", 0, 0, Arial, textSize)
    question16Answer1Second:setTextColor(0, 0, 1)

    -- set the second wrong answer text, text color, and position
    question16Answer2First = display.newText("ORANGE", 0, 0, Arial, textSize)
    question16Answer2First:setTextColor(127/255, 0, 1)
    question16Answer2Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question16Answer2Plus:setTextColor(0, 0, 0)
    question16Answer2Second = display.newText("GREEN", 0, 0, Arial, textSize)
    question16Answer2Second:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question16Answer3First = display.newText("YELLOW", 0, 0, Arial, textSize)
    question16Answer3First:setTextColor(1, 51/255, 1)
    question16Answer3Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question16Answer3Plus:setTextColor(0, 0, 0)
    question16Answer3Second = display.newText("PURPLE", 0, 0, Arial, textSize)
    question16Answer3Second:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question16CorrectAnswerFirst)
    sceneGroup:insert(question16CorrectAnswerPlus)
    sceneGroup:insert(question16CorrectAnswerSecond)
    sceneGroup:insert(question16Answer1First)
    sceneGroup:insert(question16Answer1Plus)
    sceneGroup:insert(question16Answer1Second)
    sceneGroup:insert(question16Answer2First)
    sceneGroup:insert(question16Answer2Plus)
    sceneGroup:insert(question16Answer2Second)
    sceneGroup:insert(question16Answer3First)
    sceneGroup:insert(question16Answer3Plus)
    sceneGroup:insert(question16Answer3Second)
end

local function AskQuestion17(sceneGroup)
    -- set the question text
    question17Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question17CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question17CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question17Answer1 = display.newText("", 0, 0, Arial, textSize)
    question17Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question17Answer2 = display.newText("", 0, 0, Arial, textSize)
    question17Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question17Answer3 = display.newText("", 0, 0, Arial, textSize)
    question17Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question17Text)
    sceneGroup:insert(question17CorrectAnswer)
    sceneGroup:insert(question17Answer1)
    sceneGroup:insert(question17Answer2)
    sceneGroup:insert(question17Answer3)
end

local function AskQuestion18(sceneGroup)
    -- set the question text
    question18Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question18CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question18CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question18Answer1 = display.newText("", 0, 0, Arial, textSize)
    question18Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question18Answer2 = display.newText("", 0, 0, Arial, textSize)
    question18Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question18Answer3 = display.newText("", 0, 0, Arial, textSize)
    question18Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question18Text)
    sceneGroup:insert(question18CorrectAnswer)
    sceneGroup:insert(question18Answer1)
    sceneGroup:insert(question18Answer2)
    sceneGroup:insert(question18Answer3)
end

local function AskQuestion19(sceneGroup)
    -- set the question text
    question19Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question19CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question19CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question19Answer1 = display.newText("", 0, 0, Arial, textSize)
    question19Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question19Answer2 = display.newText("", 0, 0, Arial, textSize)
    question19Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question19Answer3 = display.newText("", 0, 0, Arial, textSize)
    question19Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question19Text)
    sceneGroup:insert(question19CorrectAnswer)
    sceneGroup:insert(question19Answer1)
    sceneGroup:insert(question19Answer2)
    sceneGroup:insert(question19Answer3)
end

local function AskQuestion20(sceneGroup)
    -- set the question text
    question20Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question20CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question20CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question20Answer1 = display.newText("", 0, 0, Arial, textSize)
    question20Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question20Answer2 = display.newText("", 0, 0, Arial, textSize)
    question20Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question20Answer3 = display.newText("", 0, 0, Arial, textSize)
    question20Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question20Text)
    sceneGroup:insert(question20CorrectAnswer)
    sceneGroup:insert(question20Answer1)
    sceneGroup:insert(question20Answer2)
    sceneGroup:insert(question20Answer3)
end

-- ask a question
function AskQuestion(sceneGroup)
    -- choose out of the possoble 20 questions
    questionNumber = 1 --math.random(1, 20)

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
        --AddTextListeners()
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
        --RemoveTextListeners()
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

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